import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:artboard/index.dart';
import 'package:public_activity_artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:device_screen/index.dart';
import 'package:path/path.dart' as path;
import 'package:mqtt_client/mqtt_client.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:convert';

import 'package:jose/jose.dart';

import 'bloc.dart';
import 'data/index.dart';

class RootWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final AppBloc tableBloc = BlocProvider.of<AppBloc>(context);
    final stream = StreamBuilder<StreamableAppStateData>(
      stream: tableBloc.outAppState,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        final appState = snapshot.data;

        Artboard startingArtboard;
        if (appState.isInSession) {
          startingArtboard = PublicActivityVerticalFullScreenArtboard();
        } else {
          startingArtboard = PublicActivityVerticalFullScreenArtboard();
          // ThreadArtboard();
          //PublicActivityArtboard();
        }

        return VerticalFullScreenArtboardNavigator(artboard: startingArtboard);
      },
    );
    // return DeviceScreen(child: stream);
    return Center(child: ConnectionWidget());
  }
}

class ConnectionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ConnectionWidgetState();
}

class ConnectionWidgetState extends State<ConnectionWidget> {
  StreamSubscription subscription;

  String url = 'mqtt.googleapis.com';
  int port = 8883; //443;

  String clientId =
      'projects/roof-6b388/locations/us-central1/registries/app/devices/app';

  String username = "unused";

  final password =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1NTY2MDQ5NTUsImV4cCI6MTU1NjYwODU1NSwiYXVkIjoicm9vZi02YjM4OCJ9.YnR-3MXhxO09bPPa5xkXQpByM50Bpg3QcrKeS8HD1NUGgpAOQx25E0Gv9d8JXyEXjayrTFaDEXJgrtmLNNe7QCJT0ruNNrPoszDIBvnUBd6wSCcKNuWMbaowuSMfZ_EynRK0cHHNmlUHRJ5aQEl_2YP7wj5ygWZdSc4P6t5vOd0kaXkYDIVRD8lbpTUpRhMMGXqmrk6eWRDYhYO5usOwmyeLjDERfHVaFnYzF59QP_6D8r3yES7fxWEEHjK9huUpHjTwFSfG58t7v2gtqJahVZXSzJk3b6W-4TOgdWo54lQwDaxOTdq26aHS7llhiWwBEcDz6m6gwz6pEZXDW1iOmw";
  // Future<String> get password async {
  //   final privateKey = await DefaultAssetBundle.of(context)
  //       .loadStructuredData("rsa_private.pem", (string) async {
  //     List<int> bytes = utf8.encode(string);
  //     final base64Str = base64.encode(bytes);
  //     return base64Str;
  //   });
  //   print("priv $privateKey");
  //   var claims = new JsonWebTokenClaims.fromJson({
  //     "aud": "roof-6b388",
  //     "isa": DateTime.now().millisecondsSinceEpoch / 1000,
  //     "exp": DateTime.now().add(Duration(minutes: 20)).millisecondsSinceEpoch /
  //         1000
  //   });
  //   var builder = JsonWebSignatureBuilder();
  //   builder.jsonContent = claims.toJson();
  //   builder.addRecipient(
  //     JsonWebKey.fromJson({"kty": "oct", "k": privateKey}),
  //     algorithm: "RS256",
  //   );
  //   var jws = builder.build();
  //   print(jws);
  //   print(jws.toCompactSerialization());
  //   return jws.toCompactSerialization();

  // final claimSet = JwtClaim(
  //   audience: [],
  //   issuedAt: DateTime.now(),
  //   expiry: ,
  // );
  // String token = issueJwtHS256(claimSet, privateKey);
  // print(token);
  // return token;
  // }

  // Create the client
  MqttClient client;

  final SecurityContext contextt = SecurityContext.defaultContext;

  @override
  void initState() {
    _addRoot();
    super.initState();
  }

  _addRoot() async {
    contextt.setTrustedCertificatesBytes(
      await DefaultAssetBundle.of(context).loadStructuredData("roots.pem",
          (string) async {
        List<int> bytes = utf8.encode(string);
        return bytes;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    String text;
    if (client?.connectionStatus?.state == MqttConnectionState.connected) {
      text = "connected";
    } else if (client?.connectionStatus?.state ==
        MqttConnectionState.connecting) {
      text = "connecting";
    } else if (client?.connectionStatus?.state ==
        MqttConnectionState.disconnected) {
      text = "disconnected";
    } else if (client?.connectionStatus?.state ==
        MqttConnectionState.disconnecting) {
      text = "disconnecting";
    } else if (client?.connectionStatus?.state == MqttConnectionState.faulted) {
      text = "faulted";
    } else {
      text = "nope";
    }
    final button = RaisedButton(
        child: Text(
            client?.connectionStatus?.state == MqttConnectionState.connected
                ? 'Disconnect'
                : 'Connect'),
        onPressed: () {
          if (client?.connectionStatus?.state ==
              MqttConnectionState.connected) {
            _disconnect();
          } else {
            _connect();
          }
        });
    final button2 = RaisedButton(
        child: Text('Moop'),
        onPressed: () {
          final MqttClientPayloadBuilder builder1 = MqttClientPayloadBuilder();
          builder1.addString("heartbeat");
          client.publishMessage(
              "/devices/app/events", MqttQos.atLeastOnce, builder1.payload);
        });
    return Center(
        child: Container(
            height: 400,
            width: 400,
            child: Column(
              children: <Widget>[
                Text(text),
                Container(height: 60),
                button,
                Container(height: 30),
                button2
              ],
            )));
  }

  _connect() async {
    /// First create a client, the client is constructed with a broker name, client identifier
    /// and port if needed. The client identifier (short ClientId) is an identifier of each MQTT
    /// client connecting to a MQTT broker. As the word identifier already suggests, it should be unique per broker.
    /// The broker uses it for identifying the client and the current state of the client. If you don’t need a state
    /// to be hold by the broker, in MQTT 3.1.1 you can set an empty ClientId, which results in a connection without any state.
    /// A condition is that clean session connect flag is true, otherwise the connection will be rejected.
    /// The client identifier can be a maximum length of 23 characters. If a port is not specified the standard port
    /// of 1883 is used.
    /// If you want to use websockets rather than TCP see below.
    print("LETS TRY $url $clientId");
    client = MqttClient(url, clientId);
    client.port = port;
    client.secure = true;
    client.securityContext = contextt;
    client.setProtocolV311();

    /// A websocket URL must start with ws:// or wss:// or Dart will throw an exception, consult your websocket MQTT broker
    /// for details.
    /// To use websockets add the following lines -:
    // client.useWebSocket = true;

    /// This flag causes the mqtt client to use an alternate method to perform the WebSocket handshake. This is needed for certain
    /// matt clients (Particularly Amazon Web Services IOT) that will not tolerate additional message headers in their get request
    // client.useAlternateWebSocketImplementation = true;
    // client.port = 443; // ( or whatever your WS port is)
    /// Note do not set the secure flag if you are using wss, the secure flags is for TCP sockets only.
    ///
    client.logging(on: true);

    client.keepAlivePeriod = 60;
    client.onDisconnected = _onDisconnected;
    client.onConnected = _onConnected;
    // final MqttConnectMessage connMess = MqttConnectMessage()
    //     .withClientIdentifier(
    //         'Mqtt_MyClientUniqueId2') // Must agree with the keep alive set above or not set
    //     .startClean() // Non persistent session for testing
    //     .keepAliveFor(30)
    //     // If you set this you must set a will message
    //     .withWillTopic('willtopic')
    //     .withWillMessage('My Will message')
    //     .withWillQos(MqttQos.atLeastOnce);

    print('MQTT client connecting....'); // client.connectionMessage = connMess;

    print("CONNECTING");
    try {
      await client.connect(username, password);
    } catch (e) {
      print(e);
      _disconnect();
    }

    /// Check if we are connected
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      print('MQTT client connected');
      setState(() {});
    } else {
      print('ERROR: MQTT client connection failed - '
          'disconnecting, state is ${client.connectionStatus.state}');
      _disconnect();
    }

    /// The client has a change notifier object(see the Observable class) which we then listen to to get
    /// notifications of published updates to each subscribed topic.
    subscription = client.updates.listen(_onMessage);
  }

  void _disconnect() {
    client.disconnect();
    _onDisconnected();
  }

  void _onDisconnected() {
    setState(() {
      client = null;
      subscription?.cancel();
      subscription = null;
    });
    print('MQTT client disconnected');
  }

  void _onConnected() {
    setState(() {});
    print('MQTT client disconnected');
  }

  void _onMessage(List<MqttReceivedMessage> event) {
    print(event.length);
    final MqttPublishMessage recMess = event[0].payload as MqttPublishMessage;
    final String message =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print(event.first.topic);
    print(message);

    // /// The above may seem a little convoluted for users only interested in the
    // /// payload, some users however may be interested in the received publish message,
    // /// lets not constrain ourselves yet until the package has been in the wild
    // /// for a while.
    // /// The payload is a byte buffer, this will be specific to the topic
    // print('MQTT message: topic is <${event[0].topic}>, '
    //     'payload is <-- ${message} -->');
    // print(client.connectionState);
    // setState(() {
    //   messages.add(Message(
    //     topic: event[0].topic,
    //     message: message,
    //     qos: recMess.payload.header.qos,
    //   ));
    //   try {
    //     messageController.animateTo(
    //       0.0,
    //       duration: Duration(milliseconds: 400),
    //       curve: Curves.easeOut,
    //     );
    //   } catch (_) {
    //     // ScrollController not attached to any scroll views.
    //   }
    // });
  }

  // void _subscribeToTopic(String topic) {
  //   if (connectionState == mqtt.MqttConnectionState.connected) {
  //     setState(() {
  //       if (topics.add(topic.trim())) {
  //         print('Subscribing to ${topic.trim()}');
  //         client.subscribe(topic, mqtt.MqttQos.exactlyOnce);
  //       }
  //     });
  //   }
  // }

  // void _unsubscribeFromTopic(String topic) {
  //   if (connectionState == mqtt.MqttConnectionState.connected) {
  //     setState(() {
  //       if (topics.remove(topic.trim())) {
  //         print('Unsubscribing from ${topic.trim()}');
  //         client.unsubscribe(topic);
  //       }
  //     });
  //   }
  // }
}
