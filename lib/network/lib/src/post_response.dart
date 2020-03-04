class PostResponse {
  final Map body;
  final Map headers;
  final int statusCode;

  PostResponse({
    this.body,
    this.headers,
    this.statusCode,
  });
}
