import 'dart:math';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pointycastle/export.dart';
import 'package:stream/index.dart';
import 'package:artboard/index.dart';
import 'package:public_activity_artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:convert';
import 'package:pointycastle/pointycastle.dart';
import 'dart:typed_data';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/cloudiot/v1.dart' as cloud;

import "package:asn1lib/asn1lib.dart";

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
  int port = 443;

  String clientId =
      'projects/roof-6b388/locations/us-central1/registries/app/devices/tommy';

  String username = "unused";

  String get _header {
    final header = {"alg": "RS256", "typ": "JWT"};
    final headerString = json.encode(header);
    print("header string $header");
    final headerBytes = headerString.codeUnits;
    final encodedHeader = base64Encode(headerBytes);
    return encodedHeader;
  }

  String get _payload {
    final payload = {
      "aud": "roof-6b388",
      "iat": (DateTime.now().millisecondsSinceEpoch / 1000).round(),
      "exp": (DateTime.now().add(Duration(minutes: 60)).millisecondsSinceEpoch /
              1000)
          .round()
    };

    final payloadString = json.encode(payload);
    print("payload string $payloadString");
    final payloadBytes = payloadString.codeUnits;
    final payloadContent = base64Encode(payloadBytes);
    return payloadContent;
  }

  // final _jwt =
  //     "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJyb29mLTZiMzg4IiwiaXNhIjoxNTU2Njk4OTI3LCJleHAiOjE1NTY3MDI1Mjd9.LRQbLyZEfryVgfYjD3pkRwWoyDdfg3zE8pHoNa6SoqgxVvq2_SMBQxzq4s26TL4ILgPp4rVs103f0a71v-_MVyXaSwvWEuWJPaFPgG4tK6EqwXfiVOibQoMhEpFq4LZjOjtJT1_LLmQtcBcM5P_-Wyn4yNB8DFoCJiVjb3Oo16uePot1vdc6OkcGRfTCmeSA5s8CzLHXCYwvwwxp1V5JMFryNwOqPMe2gr0H9JfR0ty8TdqR_osGCbmj44E6jvr9AgrjF2tUTxqBgKCa_p62gemikNnSBGWaXNWVH_UQFeRZr1oOJKjMy3jHuqOH7-9njSFSxdDIPU3shqlG5x-OGQ==";

  Future<String> get jwtToken async {
    // if (_jwt != null) return _jwt;
    print("making token");
    final keyHelper = RsaKeyHelper();
    print("making key pair");
    final keyPair =
        await keyHelper.computeRSAKeyPair(keyHelper.getSecureRandom());

    final formattedPublicKey =
        keyHelper.encodePublicKeyToPemPKCS1(keyPair.publicKey);
    final formattedPrivateKey =
        keyHelper.encodePrivateKeyToPemPKCS1(keyPair.privateKey);
    print("public key: $formattedPublicKey");
    print("private key: $formattedPrivateKey");

    final header = _header;
    final payload = _payload;

    final content = header + "." + payload;
    print("content $content");

    final signature = keyHelper.sign(content, keyPair.privateKey);

    print("signature $signature");
    final jwtToken = content + "." + signature;
    print("jwtToken $jwtToken");
    final device = await _gcp(formattedPublicKey);

    print("new device! $device");
    return jwtToken;
  }

  // Create the client
  MqttClient client;

  final SecurityContext contextt = SecurityContext.defaultContext;

  @override
  void initState() {
    _addRoot();
    super.initState();
  }

  _gcp(String publicKey) async {
    final accountCredentials = new auth.ServiceAccountCredentials.fromJson(r'''
{
  "type": "service_account",
  "project_id": "roof-6b388",
  "private_key_id": "f789b4bb18c02042b2c4d419ddc512761c938717",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCjUdz3JWioCx24\nfvCIVKuFCR+dPJ2+Yk2ETSIoA0MTDGUXwp7iHYRxfU/N+mkQi7Gn+wgXP6/yJDIa\nW3JqsGgv8OIJUY0JSnb7epSx72PyXnDVKp5ufFlkPZkD1L1qwINixClnTXCs2qHf\nkA+oAwqInh7p2MS0CFTgY4kBMAy21NIHLSY+64OHKic61tIc9GGsoxkjotBtBWwZ\nwVBblLF8Z3fL6hz/N3Ui9fHbFiGSe/k7cS4UgKDVIOAj7FIgrjFHDI1cqnHFeqgo\npgx44VloZHuJnIRWPhBpp8iZ7BCMhTALhUircK4j1Q/3QsRum6XPZwG40R5/T81W\nY+082uxVAgMBAAECggEAJtxRwZTrJCEQ/1dlEGtlLJCRLy6/Mg/d9f8Mg4zTJvMq\nEs9CUvdHDmIM3SwaV8+FhDzdHfsPeIRYT6E2xmAXSmD8x87Zyj4ntYrjWrtlgsQq\nAO7VJ+D6vDlT8W9rar1IBfY7C9OHXfnfznxO3WFr3joRjP8BPv1EhOfqL5gpTk9Q\nCqXzv9PnNfbHnLIQg38vH9xuKcsXav0NCZsHZetKRc2+ZWYZH5q3zVrCChHJa/kN\ngoRPwyfRsUM+YfajR0rdNEuYMTE7kPMOstP47BAdFum7O6OVwLbfY0v/dEyQ4/45\noCIh+Y1U1LIM6tYcTlONxCFNacqPIMNpj+w4HOWmAQKBgQDV1PEYaSPxWlcGFgPQ\nmuL7MrLcBoHcWdY7JKpRTzCUKNJJ4ECX0V8qvtF1RQtHP8W5c5c5TpneoHfDp8ik\nSMbJ0UDfAqPkE2UWTCXimPVTZ6+3tfaACtt+1NJ96wYIcgCVcGpEcSERlQGTzaRC\nBpw5qkhEdiDaqDE1wVnf3reulQKBgQDDhuDnGHgp1WPl0q5YIQ0OXis9Tp7ZP7sw\n+rxtDoOQyF60tvT2U7Q/4iWc6cUO08VtMisEPwecVNJbAyHrJNzKd0KP1jXBTmzp\nZXgwcNSYMR8b7av4NPuJXszGjsmUILSDhK85OcOjOPxeXkyrozK9NxhYJjj//D6y\nlPopD4GWwQKBgH7H/56ykA4Euz4vhVmEy/mWKLgN36cPWNa+OYF2C159CZmlrYaW\nK+/DLZtzMWmwJQJ8x3fB47c8u2W1MGA/iiWUvPq8rQGIglIDGh9NA3/NJUEuURW/\n2j5L3vWriGsvdKsl+MvVq36qM0I4FiDTnIMQNELrKzWZrXuqxSfX/F41AoGAJhiE\nf2JMH1J9WUz4PSGLaq48XICSAKAjN8LSrajzR2VS1oEDL29VolDMpUsC4wWt5L2u\nlfA16ma4aZUtqaQQBL7B0EabSKOgIsVranzBXznK5uUi6YRhMf2vhkxRyDOrGCjk\n/xBbJtU2jqhu5c4xV56BdsNTvcSG7sKKDy//PsECgYEAlSypYIS+HT3MoShDwmM3\nVLRii5fb7hABRPWRST9SrFAu7cdXUStifGITnUR9TnwwEzKF6wRumz+mS6JI9c7j\nmD6G0tc2n8hFt8D7LytZxkpjFG/5MfJqlCmBQWKBkHrEbbAqo8ER5pv3f5Ubrt2z\n3cceaAzkiGRtyINxz9jlf/M=\n-----END PRIVATE KEY-----\n",
  "client_email": "device-registerer@roof-6b388.iam.gserviceaccount.com",
  "client_id": "110793645455474461985",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/device-registerer%40roof-6b388.iam.gserviceaccount.com"
}''');

    final scopes = [cloud.CloudiotApi.CloudiotScope];
    final client =
        await auth.clientViaServiceAccount(accountCredentials, scopes);
    const cloudRegion = 'us-central1';
    const projectId = 'roof-6b388';
    const registryId = 'app';
    final api = cloud.CloudiotApi(client);
    const parentName = "projects/$projectId/locations/$cloudRegion";
    const registryName = "$parentName/registries/$registryId";
    final request = cloud.Device.fromJson({
      "id": "tommy",
      "credentials": [
        {
          "publicKey": {
            "format": 'RSA_PEM',
            "key": publicKey,
          },
        }
      ]
    });

    try {
      final device = await api.projects.locations.registries.devices
          .create(request, registryName);
      print("devi: $device");
    } catch (err) {
      print("err $err");
    }
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
      await client.connect(username, await jwtToken);
    } catch (e) {
      print(e);
      _disconnect();
    }

    print("CONNECTED");

    /// Check if we are connected
    if (client?.connectionStatus?.state == MqttConnectionState.connected) {
      print('MQTT client connected');
      setState(() {});
    } else {
      print('ERROR: MQTT client connection failed - '
          'disconnecting, state is ${client?.connectionStatus?.state}');
      _disconnect();
    }

    /// The client has a change notifier object(see the Observable class) which we then listen to to get
    /// notifications of published updates to each subscribed topic.
    subscription = client?.updates?.listen(_onMessage);
  }

  void _disconnect() {
    client?.disconnect();
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

SecureRandom getSecureRandom() {
  final secureRandom = FortunaRandom();
  final random = Random.secure();
  List<int> seeds = [];
  for (int i = 0; i < 32; i++) {
    seeds.add(random.nextInt(255));
  }
  secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
  return secureRandom;
}

Future<AsymmetricKeyPair<PublicKey, PrivateKey>> computeRSAKeyPair(
    SecureRandom secureRandom) async {
  return await compute(getRsaKeyPair, secureRandom);
}

/// Helper class to handle RSA key generation and encoding
class RsaKeyHelper {
  /// Generate a [PublicKey] and [PrivateKey] pair
  ///
  /// Returns a [AsymmetricKeyPair] based on the [RSAKeyGenerator] with custom parameters,
  /// including a [SecureRandom]
  Future<AsymmetricKeyPair<PublicKey, PrivateKey>> computeRSAKeyPair(
      SecureRandom secureRandom) async {
    return await compute(getRsaKeyPair, secureRandom);
  }

  /// Generates a [SecureRandom]
  ///
  /// Returns [FortunaRandom] to be used in the [AsymmetricKeyPair] generation
  SecureRandom getSecureRandom() {
    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(new KeyParameter(new Uint8List.fromList(seeds)));
    return secureRandom;
  }

  /// Decode Public key from PEM Format
  ///
  /// Given a base64 encoded PEM [String] with correct headers and footers, return a
  /// [RSAPublicKey]
  ///
  /// *PKCS1*
  /// RSAPublicKey ::= SEQUENCE {
  ///    modulus           INTEGER,  -- n
  ///    publicExponent    INTEGER   -- e
  /// }
  ///
  /// *PKCS8*
  /// PublicKeyInfo ::= SEQUENCE {
  ///   algorithm       AlgorithmIdentifier,
  ///   PublicKey       BIT STRING
  /// }
  ///
  /// AlgorithmIdentifier ::= SEQUENCE {
  ///   algorithm       OBJECT IDENTIFIER,
  ///   parameters      ANY DEFINED BY algorithm OPTIONAL
  /// }
  RSAPublicKey parsePublicKeyFromPem(pemString) {
    List<int> publicKeyDER = decodePEM(pemString);
    var asn1Parser = new ASN1Parser(publicKeyDER);
    var topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;

    var modulus, exponent;
    // Depending on the first element type, we either have PKCS1 or 2
    if (topLevelSeq.elements[0].runtimeType == ASN1Integer) {
      modulus = topLevelSeq.elements[0] as ASN1Integer;
      exponent = topLevelSeq.elements[1] as ASN1Integer;
    } else {
      var publicKeyBitString = topLevelSeq.elements[1];

      var publicKeyAsn = new ASN1Parser(publicKeyBitString.contentBytes());
      ASN1Sequence publicKeySeq = publicKeyAsn.nextObject();
      modulus = publicKeySeq.elements[0] as ASN1Integer;
      exponent = publicKeySeq.elements[1] as ASN1Integer;
    }

    RSAPublicKey rsaPublicKey =
        RSAPublicKey(modulus.valueAsBigInteger, exponent.valueAsBigInteger);

    return rsaPublicKey;
  }

  /// Sign plain text with Private Key
  ///
  /// Given a plain text [String] and a [RSAPrivateKey], decrypt the text using
  /// a [RSAEngine] cipher
  String sign(String plainText, RSAPrivateKey privateKey) {
    var signer = RSASigner(SHA256Digest(), "0609608648016503040201");
    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(privateKey));
    return base64Encode(
        signer.generateSignature(createUint8ListFromString(plainText)).bytes);
  }

  /// Creates a [Uint8List] from a string to be signed
  Uint8List createUint8ListFromString(String s) {
    var codec = Utf8Codec(allowMalformed: true);
    return Uint8List.fromList(codec.encode(s));
  }

  /// Decode Private key from PEM Format
  ///
  /// Given a base64 encoded PEM [String] with correct headers and footers, return a
  /// [RSAPrivateKey]
  RSAPrivateKey parsePrivateKeyFromPem(pemString) {
    List<int> privateKeyDER = decodePEM(pemString);
    var asn1Parser = new ASN1Parser(privateKeyDER);
    var topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;

    var modulus, privateExponent, p, q;
    // Depending on the number of elements, we will either use PKCS1 or PKCS8
    if (topLevelSeq.elements.length == 3) {
      var privateKey = topLevelSeq.elements[2];

      asn1Parser = new ASN1Parser(privateKey.contentBytes());
      var pkSeq = asn1Parser.nextObject() as ASN1Sequence;

      modulus = pkSeq.elements[1] as ASN1Integer;
      privateExponent = pkSeq.elements[3] as ASN1Integer;
      p = pkSeq.elements[4] as ASN1Integer;
      q = pkSeq.elements[5] as ASN1Integer;
    } else {
      modulus = topLevelSeq.elements[1] as ASN1Integer;
      privateExponent = topLevelSeq.elements[3] as ASN1Integer;
      p = topLevelSeq.elements[4] as ASN1Integer;
      q = topLevelSeq.elements[5] as ASN1Integer;
    }

    RSAPrivateKey rsaPrivateKey = RSAPrivateKey(
        modulus.valueAsBigInteger,
        privateExponent.valueAsBigInteger,
        p.valueAsBigInteger,
        q.valueAsBigInteger);

    return rsaPrivateKey;
  }

  List<int> decodePEM(String pem) {
    return base64.decode(removePemHeaderAndFooter(pem));
  }

  String removePemHeaderAndFooter(String pem) {
    var startsWith = [
      "-----BEGIN PUBLIC KEY-----",
      "-----BEGIN RSA PRIVATE KEY-----",
      "-----BEGIN RSA PUBLIC KEY-----",
      "-----BEGIN PRIVATE KEY-----",
      "-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
      "-----BEGIN PGP PRIVATE KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
    ];
    var endsWith = [
      "-----END PUBLIC KEY-----",
      "-----END PRIVATE KEY-----",
      "-----END RSA PRIVATE KEY-----",
      "-----END RSA PUBLIC KEY-----",
      "-----END PGP PUBLIC KEY BLOCK-----",
      "-----END PGP PRIVATE KEY BLOCK-----",
    ];
    bool isOpenPgp = pem.indexOf('BEGIN PGP') != -1;

    pem = pem.replaceAll(' ', '');
    pem = pem.replaceAll('\n', '');
    pem = pem.replaceAll('\r', '');

    for (var s in startsWith) {
      s = s.replaceAll(' ', '');
      if (pem.startsWith(s)) {
        pem = pem.substring(s.length);
      }
    }

    for (var s in endsWith) {
      s = s.replaceAll(' ', '');
      if (pem.endsWith(s)) {
        pem = pem.substring(0, pem.length - s.length);
      }
    }

    if (isOpenPgp) {
      var index = pem.indexOf('\r\n');
      pem = pem.substring(0, index);
    }

    return pem;
  }

  /// Encode Private key to PEM Format
  ///
  /// Given [RSAPrivateKey] returns a base64 encoded [String] with standard PEM headers and footers
  String encodePrivateKeyToPemPKCS1(RSAPrivateKey privateKey) {
    var version = ASN1Integer(BigInt.from(0));

    var algorithmSeq = new ASN1Sequence();
    var algorithmAsn1Obj = new ASN1Object.fromBytes(Uint8List.fromList(
        [0x6, 0x9, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0xd, 0x1, 0x1, 0x1]));
    var paramsAsn1Obj =
        new ASN1Object.fromBytes(Uint8List.fromList([0x5, 0x0]));
    algorithmSeq.add(algorithmAsn1Obj);
    algorithmSeq.add(paramsAsn1Obj);

    var privateKeySeq = new ASN1Sequence();
    var modulus = ASN1Integer(privateKey.n);
    var publicExponent = ASN1Integer(BigInt.parse('65537'));
    var privateExponent = ASN1Integer(privateKey.d);
    var p = ASN1Integer(privateKey.p);
    var q = ASN1Integer(privateKey.q);
    var dP = privateKey.d % (privateKey.p - BigInt.from(1));
    var exp1 = ASN1Integer(dP);
    var dQ = privateKey.d % (privateKey.q - BigInt.from(1));
    var exp2 = ASN1Integer(dQ);
    var iQ = privateKey.q.modInverse(privateKey.p);
    var co = ASN1Integer(iQ);

    privateKeySeq.add(version);
    privateKeySeq.add(modulus);
    privateKeySeq.add(publicExponent);
    privateKeySeq.add(privateExponent);
    privateKeySeq.add(p);
    privateKeySeq.add(q);
    privateKeySeq.add(exp1);
    privateKeySeq.add(exp2);
    privateKeySeq.add(co);
    var publicKeySeqOctetString =
        new ASN1OctetString(Uint8List.fromList(privateKeySeq.encodedBytes));

    var topLevelSeq = new ASN1Sequence();
    topLevelSeq.add(version);
    topLevelSeq.add(algorithmSeq);
    topLevelSeq.add(publicKeySeqOctetString);
    var dataBase64 = base64.encode(topLevelSeq.encodedBytes);

    return """-----BEGIN PRIVATE KEY-----\r\n$dataBase64\r\n-----END PRIVATE KEY-----""";
  }

  /// Encode Public key to PEM Format
  ///
  /// Given [RSAPublicKey] returns a base64 encoded [String] with standard PEM headers and footers
  String encodePublicKeyToPemPKCS1(RSAPublicKey publicKey) {
    var algorithmSeq = new ASN1Sequence();
    var algorithmAsn1Obj = new ASN1Object.fromBytes(Uint8List.fromList(
        [0x6, 0x9, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0xd, 0x1, 0x1, 0x1]));
    var paramsAsn1Obj =
        new ASN1Object.fromBytes(Uint8List.fromList([0x5, 0x0]));
    algorithmSeq.add(algorithmAsn1Obj);
    algorithmSeq.add(paramsAsn1Obj);

    var publicKeySeq = new ASN1Sequence();
    publicKeySeq.add(ASN1Integer(publicKey.modulus));
    publicKeySeq.add(ASN1Integer(publicKey.exponent));
    var publicKeySeqBitString =
        new ASN1BitString(Uint8List.fromList(publicKeySeq.encodedBytes));

    var topLevelSeq = new ASN1Sequence();
    topLevelSeq.add(algorithmSeq);
    topLevelSeq.add(publicKeySeqBitString);
    var dataBase64 = base64.encode(topLevelSeq.encodedBytes);

    return """-----BEGIN PUBLIC KEY-----\r\n$dataBase64\r\n-----END PUBLIC KEY-----""";
  }
}

/// Generate a [PublicKey] and [PrivateKey] pair
///
/// Returns a [AsymmetricKeyPair] based on the [RSAKeyGenerator] with custom parameters,
/// including a [SecureRandom]
AsymmetricKeyPair<PublicKey, PrivateKey> getRsaKeyPair(
    SecureRandom secureRandom) {
  var rsapars = new RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 5);
  var params = new ParametersWithRandom(rsapars, secureRandom);
  var keyGenerator = new RSAKeyGenerator();
  keyGenerator.init(params);
  return keyGenerator.generateKeyPair();
}
