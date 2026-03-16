import 'package:get/get.dart';
import 'package:zb_dezign/core/data/local/storage_service.dart';

class HeadersManager {
  static const String contentType = "application/json";
  static const String authorization = "Authorization";
  static const String accept = "application/json";

  static Map<String, String> getHeaders({
    bool isAuth = true,
    bool isContentType = false,
    bool isAccept = true,
  }) {
    return <String, String>{
      if (isContentType) "Content-Type": contentType,
      if (isAccept) "Accept": accept,
      if (isAuth)
        "Authorization":
            "Bearer ${Get.find<StorageService>().read(key: Get.find<StorageService>().tokenKey)}",
    };
  }
}
