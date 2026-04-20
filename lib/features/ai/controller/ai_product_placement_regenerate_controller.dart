import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/images_path.dart';

class AiProductPlacementRegenerateController extends GetxController {
  List items = [
    {'title': 'Sofa 1', 'image': ImagesPath.chair},
    {'title': 'Chair 1', 'image': ImagesPath.chair},
    {'title': 'Bed 1', 'image': ImagesPath.chair},
    {'title': 'Chair 2', 'image': ImagesPath.chair},
  ];

  RxInt selectedIndex = 0.obs;
  RxBool isRegenerate = false.obs;
  String get selectedLabel => "@img${selectedIndex.value + 1}";
}
