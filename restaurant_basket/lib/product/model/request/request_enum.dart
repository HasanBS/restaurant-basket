enum RequestEnum { LIMIT, OFFSET, PLACE, LANGUAGE }

extension RequestEnumString on RequestEnum {
  String get stringValue {
    switch (this) {
      case RequestEnum.LIMIT:
        return 'limit';
      case RequestEnum.OFFSET:
        return 'offset';
      case RequestEnum.PLACE:
        return 'place';
      case RequestEnum.LANGUAGE:
        return 'language';
      default:
        throw Exception('Routes Not FouND');
    }
  }
}
