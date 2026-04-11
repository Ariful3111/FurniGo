import 'package:get/get.dart';

class AiInteriorDesignController extends GetxController {
  RxList<int> expandedIndexes = <int>[].obs;
  final List<Map<String, dynamic>> sections = [
    {'title': 'Room Basics'},
    {'title': 'Style & Mood'},
    {'title': 'Furniture & Layout'},
    {'title': 'Lighting & Finishes'},
    {'title': 'Practical Preferences'},
  ];

  void toggleSection(int index) {
    if (expandedIndexes.contains(index)) {
      expandedIndexes.remove(index);
    } else {
      expandedIndexes.add(index);
    }
  }

  bool isExpanded(int index) => expandedIndexes.contains(index);
}
