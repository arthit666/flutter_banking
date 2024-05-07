
extension ListUtil on List? {
  bool get isNotBlank => this != null && this!.isNotEmpty;

  bool get isBlank => this == null || this!.isEmpty;
}

List<T> takeFirstItems<T>(List<T>? items, int limit) {
  if (items.isNotBlank) {
    return items!.length > limit
        ? items.sublist(0, limit).toList()
        : toListOf(items);
  }
  throw Exception('cannot case');
}

List<T> toListOf<T>(dynamic data) {
  if (data is List<T>) {
    return data;
  }
  throw Exception('cannot case');
}

List<T> flattenDeep<T>(Iterable<dynamic> list) => [
      for (var element in list)
        if (element is! Iterable) element else ...flattenDeep(element),
    ];
