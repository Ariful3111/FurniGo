import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_furniture.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_lighting.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_mood.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_practical.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_room.dart';

class AiInteriorDesignController extends GetxController {
  RxList<int> expandedIndexes = <int>[].obs;
  final List<Map<String, dynamic>> sections = [
    {'title': 'Room Basics', 'widget': AiInteriorDesignPreferenceRoom()},
    {'title': 'Style & Mood', 'widget': AiInteriorDesignPreferenceMood()},
    {
      'title': 'Furniture & Layout',
      'widget': AiInteriorDesignPreferenceFurniture(),
    },
    {
      'title': 'Lighting & Finishes',
      'widget': AiInteriorDesignPreferenceLighting(),
    },
    {
      'title': 'Practical Preferences',
      'widget': AiInteriorDesignPreferencePractical(),
    },
  ];
  bool isExpanded(int index) => expandedIndexes.contains(index);
  RxList<String> selectedRooms = <String>[].obs;
  RxInt selectedPreference = 0.obs;
  List preference = ['Styling Only', 'Full Renovation'];
  List<String> roomTypes = [
    'Living Room',
    'Dining Room',
    'Bathroom',
    'Bed Room',
    'Kitchen',
    'Office',
  ];
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  RxInt selectedStyleIndex = 0.obs;
  List<String> styles = [
    "Modern",
    "Minimal",
    "Luxury",
    "Scandinavian",
    "Industrial",
  ];
  RxInt selectedColorIndex = 0.obs;
  List<Map<String, dynamic>> colorMoodList = [
    {"title": "Light", "color": AppColors.primaryBorderColor},
    {"title": "Dark", "color": AppColors.darkColor},
    {"title": "Warm", "color": AppColors.darkErrorBorder},
    {"title": "Cool", "color": AppColors.lightTextColor},
  ];
  RxList<int> selectedMaterials = <int>[].obs;
  List<String> materials = ["Wood", "Marble", "Fabric", "Metal"];
  final List<String> furnitureItems = [
    'Bed',
    'Sofa',
    'Table',
    'Wardrobe',
    'Desk',
    'TV Unit',
  ];

  RxList<String> selectedItems = <String>[].obs;
  RxString keepExisting = 'Yes'.obs;
  RxInt selectedToneIndex = 0.obs;

  final List<String> toneList = ['Warm', 'Neutral', 'Cool'];
  RxList<bool> selectedElements = <bool>[].obs;
  final List<String> elementsList = ['Ceiling', 'Wall', 'Floor lamps'];
  RxInt selectedWallIndex = 0.obs;
  final List<Map<String, String>> wallList = [
    {'title': 'Paint', 'image': ImagesPath.product},
    {'title': 'Wallpaper', 'image': ImagesPath.product},
    {'title': 'Feature Panel', 'image': ImagesPath.product},
  ];
  RxInt selectedFloorIndex = 0.obs;
  final List<Map<String, String>> floorList = [
    {'title': 'Marble', 'image': ImagesPath.product},
    {'title': 'Tile', 'image': ImagesPath.product},
    {'title': 'Wood', 'image': ImagesPath.product},
  ];
  RxString rentalFriendly = 'Yes'.obs;
  RxString kidsPets = 'Yes'.obs;

  @override
  void onInit() {
    selectedElements.value = List.generate(elementsList.length, (_) => false);
    super.onInit();
  }

  @override
  void dispose() {
    lengthController.dispose();
    widthController.dispose();
    heightController.dispose();
    super.dispose();
  }
}
