import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture.dart';

enum QuoteItemAction { none, approved, change, closed }

class RentalQuotesController extends GetxController {
  List furniture = [
    {
      'title': 'Master Bedroom',
      'widget': RentalQuotesFurniture(category: 'furniture'),
    },
    {
      'title': 'Bedroom 01',
      'widget': RentalQuotesFurniture(category: 'furniture'),
    },
    {
      'title': 'Living Room',
      'widget': RentalQuotesFurniture(category: 'furniture'),
    },
    {
      'title': 'Dining Room',
      'widget': RentalQuotesFurniture(category: 'furniture'),
    },
    {
      'title': 'Kitchen',
      'widget': RentalQuotesFurniture(category: 'furniture'),
    },
  ];
  List appliance = [
    {
      'title': 'Master Bedroom',
      'widget': RentalQuotesFurniture(category: 'appliance'),
    },
    {
      'title': 'Bedroom 01',
      'widget': RentalQuotesFurniture(category: 'appliance'),
    },
    {
      'title': 'Living Room',
      'widget': RentalQuotesFurniture(category: 'appliance'),
    },
    {
      'title': 'Dining Room',
      'widget': RentalQuotesFurniture(category: 'appliance'),
    },
    {
      'title': 'Kitchen',
      'widget': RentalQuotesFurniture(category: 'appliance'),
    },
  ];
  RxList<Map<String, dynamic>> furnitureItems = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> applianceItems = <Map<String, dynamic>>[].obs;

  RxList<QuoteItemAction> furnitureActions = <QuoteItemAction>[].obs;
  RxList<QuoteItemAction> applianceActions = <QuoteItemAction>[].obs;

  RxList<bool> isFurnitureExpanded = <bool>[].obs;
  RxList<bool> isApplianceExpanded = <bool>[].obs;

  RxList<bool> isOpen = <bool>[].obs;
  RxList<bool> isOpenAppliance = <bool>[].obs;
  RxList<Map<String, dynamic>> item = <Map<String, dynamic>>[].obs;
  RxList<QuoteItemAction> itemActions = <QuoteItemAction>[].obs;
  RxBool isShowItem = false.obs;
  RxBool isShowInfo = false.obs;
  RxList<Map<String, dynamic>> approvedItems = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> revisedItems = <Map<String, dynamic>>[].obs;
  bool get hasResetItem =>
      furnitureActions.any((action) => action == QuoteItemAction.change) ||
      applianceActions.any((action) => action == QuoteItemAction.change);

  @override
  void onInit() {
    super.onInit();
    isOpen.value = List.generate(furniture.length, (_) => false);
    isOpenAppliance.value = List.generate(appliance.length, (_) => false);
    furnitureItems.assignAll([
      {
        'title': 'Item:',
        'image': IconsPath.furniture,
        'name': 'Modern Velvet Sofa',
        'qty': '01',
        'price': '\$320',
        'discount(3%)': '-\$10',
        'charge': '\$20',
        'category': 'furniture',
      },
      {
        'title': 'Item:',
        'image': IconsPath.furniture,
        'name': 'Modern Velvet Sofa',
        'qty': '01',
        'discount(3%)': '-\$10',
        'price': '\$320',
        'charge': '\$0',
        'category': 'furniture',
      },
      {
        'title': 'Item:',
        'image': IconsPath.furniture,
        'name': 'Modern Velvet Sofa',
        'qty': '01',
        'discount(3%)': '-\$10',
        'price': '\$320',
        'charge': '\$0',
        'category': 'furniture',
      },
    ]);

    furnitureActions.value = List<QuoteItemAction>.filled(
      furnitureItems.length,
      QuoteItemAction.none,
      growable: true,
    );

    isFurnitureExpanded.value = List<bool>.filled(furnitureItems.length, false);
    applianceItems.assignAll([
      {
        'title': 'Item:',
        'image': IconsPath.furniture,
        'name': 'Refrigerator',
        'qty': '01',
        'price': '\$320',
        'discount(3%)': '-\$10',
        'charge': '\$20',
        'category': 'appliance',
      },
      {
        'title': 'Item:',
        'image': IconsPath.furniture,
        'name': 'Microwave',
        'qty': '01',
        'discount(3%)': '-\$5',
        'price': '\$150',
        'charge': '\$0',
        'category': 'appliance',
      },
    ]);

    applianceActions.value = List<QuoteItemAction>.filled(
      applianceItems.length,
      QuoteItemAction.none,
      growable: true,
    );

    isApplianceExpanded.value = List<bool>.filled(applianceItems.length, false);
    item.assignAll(furnitureItems);
    itemActions.assignAll(furnitureActions);
  }

  void toggleItemAction(
    int index,
    QuoteItemAction action, {
    String category = 'furniture',
  }) {
    final isFurniture = category == 'furniture';
    final targetItems = isFurniture ? furnitureItems : applianceItems;
    final targetActions = isFurniture ? furnitureActions : applianceActions;
    final targetExpanded = isFurniture
        ? isFurnitureExpanded
        : isApplianceExpanded;

    if (index < 0 || index >= targetItems.length) {
      return;
    }

    final current = targetActions[index];
    final newAction = current == action ? QuoteItemAction.none : action;

    targetActions[index] = newAction;

    final currentItem = targetItems[index];

    if (newAction == QuoteItemAction.approved) {
      if (!approvedItems.contains(currentItem)) approvedItems.add(currentItem);
      revisedItems.remove(currentItem);
    } else if (newAction == QuoteItemAction.change) {
      if (!revisedItems.contains(currentItem)) revisedItems.add(currentItem);
      approvedItems.remove(currentItem);
    } else {
      approvedItems.remove(currentItem);
      revisedItems.remove(currentItem);
    }

    if (newAction == QuoteItemAction.closed) {
      targetItems.removeAt(index);
      targetActions.removeAt(index);
      targetExpanded.removeAt(index);
      approvedItems.remove(currentItem);
      revisedItems.remove(currentItem);
    }
  }

  void toggleItemExpanded(int index, {String category = 'furniture'}) {
    final isFurniture = category == 'furniture';
    final targetExpanded = isFurniture
        ? isFurnitureExpanded
        : isApplianceExpanded;

    if (index >= 0 && index < targetExpanded.length) {
      targetExpanded[index] = !targetExpanded[index];
    }
  }

  void approveAll() {
    revisedItems.clear();
    approvedItems.clear();

    // Approve all furniture
    for (int i = 0; i < furnitureItems.length; i++) {
      furnitureActions[i] = QuoteItemAction.approved;
      approvedItems.add(furnitureItems[i]);
    }

    // Approve all appliances
    for (int i = 0; i < applianceItems.length; i++) {
      applianceActions[i] = QuoteItemAction.approved;
      approvedItems.add(applianceItems[i]);
    }
  }
}
