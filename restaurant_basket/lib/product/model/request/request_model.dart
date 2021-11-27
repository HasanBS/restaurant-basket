class RequestModel {
  final int limit;
  final int offset;
  final String place;
  final String language;

  RequestModel({
    required this.place,
    required this.language,
    required this.limit,
    required this.offset,
  });
}
