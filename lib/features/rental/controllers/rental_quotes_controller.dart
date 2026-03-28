import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';

enum QuoteItemAction { none, approved, change, closed }

class RentalQuotesController extends GetxController {
  RxString selectedCard = ''.obs;

  // Dynamic lists based on rental details
  RxList<Map<String, dynamic>> furniture = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> appliance = <Map<String, dynamic>>[].obs;

  RxList<Map<String, dynamic>> furnitureItems = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> applianceItems = <Map<String, dynamic>>[].obs;

  RxList<QuoteItemAction> furnitureActions = <QuoteItemAction>[].obs;
  RxList<QuoteItemAction> applianceActions = <QuoteItemAction>[].obs;

  // Card list for payment dialog
  List<String> get cardList => [
    '**** **** **** 1234',
    '**** **** **** 5678',
    '**** **** **** 9012',
  ];

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

  set hasResetItem(bool value) {
    // Reset all change actions when setting to false
    if (!value) {
      furnitureActions.assignAll(
        furnitureActions
            .map(
              (action) => action == QuoteItemAction.change
                  ? QuoteItemAction.none
                  : action,
            )
            .toList(),
      );
      applianceActions.assignAll(
        applianceActions
            .map(
              (action) => action == QuoteItemAction.change
                  ? QuoteItemAction.none
                  : action,
            )
            .toList(),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    _initializeFromRentalDetails();
  }

  void _initializeFromRentalDetails() {
    final detailsController = Get.find<RentalDetailsController>();
    final rentalDetails = detailsController.rentalDetails.value;

    if (rentalDetails != null) {
      // Initialize furniture data
      if (rentalDetails.furnitureSelection != null) {
        furniture.assignAll(
          rentalDetails.furnitureSelection!
              .map(
                (selection) => {
                  'room': selection.room ?? 'Unknown Room',
                  'items':
                      selection.items
                          ?.map(
                            (item) => {
                              'name': item.name ?? 'Unknown',
                              'count': item.count ?? 1,
                            },
                          )
                          .toList() ??
                      [],
                  'condition': selection.condition ?? 'Good',
                  'style': selection.style ?? 'Modern',
                },
              )
              .toList(),
        );

        // Initialize furniture items
        final List<Map<String, dynamic>> tempFurnitureItems = [];
        for (var selection in rentalDetails.furnitureSelection!) {
          if (selection.items != null) {
            for (var item in selection.items!) {
              tempFurnitureItems.add({
                'name': item.name ?? 'Unknown',
                'count': item.count ?? 1,
                'price': 0.0, // Default price since it's not in the model
              });
            }
          }
        }
        furnitureItems.assignAll(tempFurnitureItems);

        // Initialize furniture actions and expanded states
        furnitureActions.assignAll(
          List.filled(
            rentalDetails.furnitureSelection!.length,
            QuoteItemAction.none,
          ),
        );
        isFurnitureExpanded.assignAll(
          List.filled(rentalDetails.furnitureSelection!.length, false),
        );
      }

      // Initialize appliance data
      if (rentalDetails.applianceSelection != null) {
        appliance.assignAll(
          rentalDetails.applianceSelection!
              .map(
                (selection) => {
                  'room': selection.room ?? 'Unknown Room',
                  'items':
                      selection.items
                          ?.map(
                            (item) => {
                              'name': item.name ?? 'Unknown',
                              'count': item.count ?? 1,
                            },
                          )
                          .toList() ??
                      [],
                  'condition': 'Good', // Default since it's not in the model
                  'style': 'Modern', // Default since it's not in the model
                },
              )
              .toList(),
        );

        // Initialize appliance items
        final List<Map<String, dynamic>> tempApplianceItems = [];
        for (var selection in rentalDetails.applianceSelection!) {
          if (selection.items != null) {
            for (var item in selection.items!) {
              tempApplianceItems.add({
                'name': item.name ?? 'Unknown',
                'count': item.count ?? 1,
                'price': 0.0, // Default price since it's not in the model
              });
            }
          }
        }
        applianceItems.assignAll(tempApplianceItems);

        // Initialize appliance actions and expanded states
        applianceActions.assignAll(
          List.filled(
            rentalDetails.applianceSelection!.length,
            QuoteItemAction.none,
          ),
        );
        isApplianceExpanded.assignAll(
          List.filled(rentalDetails.applianceSelection!.length, false),
        );
      }
    }
  }

  void toggleItemExpanded(int index, bool isAppliance) {
    if (isAppliance) {
      if (index < isApplianceExpanded.length) {
        isApplianceExpanded[index] = !isApplianceExpanded[index];
      }
    } else {
      if (index < isFurnitureExpanded.length) {
        isFurnitureExpanded[index] = !isFurnitureExpanded[index];
      }
    }
  }

  void toggleItemAction(int index, bool isAppliance) {
    if (isAppliance) {
      if (index < applianceActions.length) {
        final currentAction = applianceActions[index];
        final newAction = currentAction == QuoteItemAction.change
            ? QuoteItemAction.none
            : QuoteItemAction.change;
        applianceActions[index] = newAction;
      }
    } else {
      if (index < furnitureActions.length) {
        final currentAction = furnitureActions[index];
        final newAction = currentAction == QuoteItemAction.change
            ? QuoteItemAction.none
            : QuoteItemAction.change;
        furnitureActions[index] = newAction;
      }
    }
  }

  void toggleShowInfo() {
    isShowInfo.value = !isShowInfo.value;
  }

  void approveAll() {
    furnitureActions.assignAll(
      List.filled(furnitureActions.length, QuoteItemAction.approved),
    );
    applianceActions.assignAll(
      List.filled(applianceActions.length, QuoteItemAction.approved),
    );
  }
}
