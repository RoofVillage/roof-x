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
    return BlossmResponse._internal(
      statusCode: map['statusCode'],
      code: map['code'],
      message: map['message'],
      info: map['info'],
    );
  }
}
