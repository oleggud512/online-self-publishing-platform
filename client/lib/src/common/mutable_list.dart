extension MutableList<T> on List<T> {
  List<T> copyWith(T item, { bool start = false }) {
    if (start) return [item, ...this];
    return [...this, item];
  }

  List<T> copyWithout(T item) {
    return [...this]..remove(item);
  }

  List<T> copyWithoutWhere(bool Function(T item) predicate) {
    T item = firstWhere(predicate);
    return copyWithout(item);
  }

  List<T> copyToggle(T item, { bool start = false }) {
    return contains(item) ? copyWithout(item) : copyWith(item, start: start);
  }
}