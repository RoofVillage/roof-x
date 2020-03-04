class BlossmResponse {
  int statusCode;
  String code;
  String message;
  Map<String, String> info;

  BlossmResponse._internal({
    this.statusCode,
    this.code,
    this.message,
    this.info,
  });

  factory BlossmResponse.fromMap(Map map) {
    final _map = map ?? {};
    return BlossmResponse._internal(
      statusCode: _map['statusCode'],
      code: _map['code'],
      message: _map['message'],
      info: _map['info'],
    );
  }
}
