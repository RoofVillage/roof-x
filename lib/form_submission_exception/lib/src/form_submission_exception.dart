class FormSubmissionException implements Exception {
  final String message;

  factory FormSubmissionException.didTimeout() => FormSubmissionException(
        "That took too long, please try again.",
      );

  FormSubmissionException(this.message);
}
