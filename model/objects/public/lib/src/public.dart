import 'package:meta/meta.dart';
import 'package:key/index.dart' as _key;

class PublicCompletion {
  final String who;
  final String name;
  final String roof;
  final String note;

  PublicCompletion(
      {@required this.who,
      @required this.name,
      @required this.roof,
      this.note});

  factory PublicCompletion.fromMap(Map<String, Object> map) {
    assert(map != null);

    return PublicCompletion(
      who: map[_key.who],
      name: map[_key.name],
      roof: map[_key.roof],
      note: map[_key.note],
    );
  }
}

class PublicExpense {
  final String who;
  final String note;
  final String roof;

  PublicExpense({@required this.who, @required this.roof, @required this.note});

  factory PublicExpense.fromMap(Map<String, Object> map) {
    assert(map != null);

    return PublicExpense(
      who: map[_key.who],
      roof: map[_key.roof],
      note: map[_key.note],
    );
  }
}

class PublicTransfer {
  final String payer;
  final String receiver;
  final String note;
  final String roof;

  PublicTransfer(
      {@required this.payer,
      @required this.receiver,
      @required this.roof,
      this.note});

  factory PublicTransfer.fromMap(Map<String, Object> map) {
    assert(map != null);

    return PublicTransfer(
      payer: map[_key.payer],
      receiver: map[_key.receiver],
      roof: map[_key.roof],
      note: map[_key.note],
    );
  }
}

class PublicLandlordTransfer {
  final String who;
  final String home;
  final String name;
  final String note;
  final String landlord;

  PublicLandlordTransfer(
      {@required this.who,
      @required this.home,
      @required this.name,
      @required this.landlord,
      @required this.note});

  factory PublicLandlordTransfer.fromMap(Map<String, Object> map) {
    assert(map != null);

    return PublicLandlordTransfer(
      who: map[_key.who],
      home: map[_key.home],
      name: map[_key.name],
      landlord: map[_key.landlord],
      note: map[_key.note],
    );
  }
}

class PublicMaintenanceRequest {
  final String who;
  final String home;
  final String name;
  final String note;

  PublicMaintenanceRequest(
      {@required this.who,
      @required this.home,
      @required this.name,
      @required this.note});

  factory PublicMaintenanceRequest.fromMap(Map<String, Object> map) {
    assert(map != null);

    return PublicMaintenanceRequest(
      who: map[_key.who],
      home: map[_key.home],
      name: map[_key.name],
      note: map[_key.note],
    );
  }
}
