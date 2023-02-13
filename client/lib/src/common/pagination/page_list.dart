extension PageList<T> on List<T> {
  List<T> addPage(List<T> page) {
    return [...this, ...page];
  }
}