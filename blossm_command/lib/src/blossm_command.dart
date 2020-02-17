import 'dart:async';

import 'package:blossm_command/src/utils/fake_command_response.dart';
import 'package:blossm_command/src/utils/response.dart';
import 'package:flutter/material.dart';
import 'package:network/index.dart';
import 'package:blossm_command/index.dart';
import 'package:blossm_command/src/utils/index.dart';

abstract class BlossmCommandDispatcher {
  static const _cookieKey = 'set-cookie';
  static const _sessionTokenPrefix = 'session=';
  static const _challengeTokenPrefix = 'challenge=';

  String get domain;
  String get baseUrl;
  TokenStore get tokenStore;

  // This method is called whenever a command is issued without a valid authentication token.
  Future<void> Function() get onTokenInvalid;

  // This method is called whenever a challenge is issued.
  Future<void> Function() get onChallengeIssued;

  Future<BlossmResponse> dispatch({
    @required String route,
    Map payload,
    bool isChallenge,
  }) async {
    final url = "https://command.$domain.$baseUrl/$route";

    final Map<String, String> headers = {};

    final String token = isChallenge == true
        ? await tokenStore.readChallengeToken()
        : await tokenStore.readSessionToken();

    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    final Map<String, Object> body = {
      "payload": payload,
      "headers": {
        "issued": DateTime.now().toIso8601String(),
      },
    };

    final response = await Network.post(
      address: url,
      params: body,
      headers: headers,
    );

    return _handlePostResponse(
      response: response,
      isChallenge: isChallenge,
    );
  }

  Future<BlossmResponse> _handlePostResponse({
    PostResponse response,
    bool isChallenge,
  }) {
    final BlossmResponse data = BlossmResponse.fromMap(response.body);

    switch (data.statusCode) {
      case 401:
        print('unauthorized');
        onTokenInvalid();
        return Future.value(
          BlossmResponse.fromMap({}),
        );
      case 400:
      case 404:
      case 409:
      case 500:
        throw ('Blossm command error: ${data.message}');
    }

    if (isChallenge == true && tokenStore != null) {
      print('deleting token');
      tokenStore.deleteChallengeToken();
    }

    final String cookie = response.headers[_cookieKey];
    if (cookie != null) _handleTokenFromCookie(cookie);

    return Future.value(data);
  }

  void _handleTokenFromCookie(String cookie) {
    if (cookie == null || tokenStore == null) return;

    if (cookie.contains(_challengeTokenPrefix)) {
      final String newChallengeToken = cookie.split(_challengeTokenPrefix)[1];

      if (newChallengeToken != null)
        tokenStore.saveChallengeToken(newChallengeToken);

      onChallengeIssued();
    } else if (cookie.contains(_sessionTokenPrefix)) {
      final String newSessionToken = cookie.split(_sessionTokenPrefix)[1];

      if (newSessionToken != null) tokenStore.saveSessionToken(newSessionToken);
    }
  }

  Future fakeSuccess({
    @required String route,
    @required Map payload,
    @required Map response,
  }) async {
    print(
      "Faking success from command with route '$route' and payload: $payload",
    );

    return Future.delayed(
      Duration(milliseconds: 500),
      () => FakeCommandResponse(
        status: "200",
        body: response,
      ),
    );
  }

  Future fakeError({
    @required String route,
    @required Map payload,
    @required Map response,
  }) async {
    print(
      "Faking error from command with route '$route' and payload: $payload",
    );

    return Future.delayed(
      Duration(milliseconds: 500),
      () => {
        "status": '400',
        "body": response,
      },
    );
  }
}
