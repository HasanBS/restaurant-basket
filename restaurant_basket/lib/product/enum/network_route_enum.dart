enum NetworkRoutes { MERCHANTS }

extension NetwrokRoutesString on NetworkRoutes {
  String get stringValue {
    switch (this) {
      case NetworkRoutes.MERCHANTS:
        return 'merchants';
      default:
        throw Exception('Routes Not FouND');
    }
  }
}
