import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final String themeKey = "isDarkMode";

  Future<void> saveThemeToStorage(bool value) async {
    await _box.write(themeKey, value);
  }

  bool getIsDark() {
    final storeTheme = _box.read<bool>(themeKey);
    return storeTheme ?? false;
  }
}
