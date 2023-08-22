abstract class ILocalStorage {
  Future<T?> get<T>(String boxId, {required String key});
  Future<List<T>>? getAll<T>(String boxId);
  Future<void> put<T>(String boxId, {required String key, required T value});
  Future<void> delete<T>(String boxId, {required String key});
}
