class ServiceResult<T> {
  int statusCode;
  String statusMessage;
  T? content;

  ServiceResult(
      {required this.content,
      required this.statusCode,
      required this.statusMessage});
}
