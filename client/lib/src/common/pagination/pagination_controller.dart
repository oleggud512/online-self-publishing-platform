abstract class PaginationController {
  
  Future<void> refresh();

  /// whether page has been added or not
  Future<bool> addPage();
}