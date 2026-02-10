import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();
  final String tokenKey = "token";

  T? read<T>({required String key}) {
    return _box.read(key);
  }

  Future<void> write({required String key, required dynamic value})async{
    await _box.write(key, value);
  }

  Future<void> remove({required String key})async{
    await _box.remove(key);
  }

  Future<void> clear() async{
    await _box.erase();
  }
}
