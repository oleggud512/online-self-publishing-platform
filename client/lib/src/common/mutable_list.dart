extension MutableList<T> on List<T> {
  List<T> copyWith(T item) {
    return [...this, item];
  }

  List<T> copyWithout(T item) {
    return [...this]..remove(item);
  }

  List<T> copyToggle(T item) {
    return contains(item) ? copyWithout(item) : copyWith(item);
  }
}