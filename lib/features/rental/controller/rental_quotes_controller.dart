import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture.dart';

enum QuoteItemAction { none, approved, change, closed }

class RentalQuotesController extends GetxController {
  List furniture = [
    {'title': 'Master Bedroom', 'widget': const RentalQuotesFurniture()},
    {'title': 'Bedroom 01', 'widget': const RentalQuotesFurniture()},
    {'title': 'Living Room', 'widget': const RentalQuotesFurniture()},
    {'title': 'Dining Room', 'widget': const RentalQuotesFurniture()},
    {'title': 'Kitchen', 'widget': const RentalQuotesFurniture()},
  ];
  RxList<Map<String, dynamic>> item = <Map<String, dynamic>>[].obs;
  RxList<bool> isOpen = <bool>[].obs;
  RxList<QuoteItemAction> itemActions = <QuoteItemAction>[].obs;
  RxList<Map<String, dynamic>> approvedItems = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> revisedItems = <Map<String, dynamic>>[].obs;

  bool get hasResetItem =>
      itemActions.any((action) => action == QuoteItemAction.change);

  double get grandTotal {
    return subtotal + totalCharge - totalDiscount;
  }

  double get subtotal {
    double total = 0;
    for (final item in [...approvedItems, ...revisedItems]) {
      final qty = _parseInt(item['qty']);
      final price = _parseMoney(item['price']);
      total += (qty * price);
    }
    return total;
  }

  double get totalDiscount {
    double total = 0;
    for (final item in [...approvedItems, ...revisedItems]) {
      total += _parseMoney(item['discount(3%)']);
    }
    return total;
  }

  double get totalCharge {
    double total = 0;
    for (final item in [...approvedItems, ...revisedItems]) {
      total += _parseMoney(item['charge']);
    }
    return total;
  }

  @override
  void onInit() {
    super.onInit();
    isOpen.value = List.generate(furniture.length, (_) => false);
    item.assignAll([
      {
        'title': 'Item:',
        'image': IconsPath.furniture,
        'name': 'Modern Velvet Sofa',
        'qty': '01',
        'price': '\$20',
        'discount(3%)': '-\$10',
        'charge': '\$20',
      },
      {
        'title': 'Item:',
        'image': IconsPath.furniture,
        'name': 'Modern Velvet Sofa',
        'qty': '01',
        'price': '\$20',
      },
      {
        'title': 'Item:',
        'image': IconsPath.furniture,
        'name': 'Modern Velvet Sofa',
        'qty': '01',
        'price': '\$20',
      },
    ]);
    itemActions.value = List<QuoteItemAction>.filled(
      item.length,
      QuoteItemAction.none,
      growable: true,
    );
  }

  void toggleItemAction(int index, QuoteItemAction action) {
    if (index < 0 || index >= item.length) {
      return;
    }
    final current = itemActions[index];
    final newAction = current == action ? QuoteItemAction.none : action;

    itemActions[index] = newAction;

    final currentItem = item[index];

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
      item.removeAt(index);
      itemActions.removeAt(index);
      approvedItems.remove(currentItem);
      revisedItems.remove(currentItem);
    }
  }

  void approveAll() {
    revisedItems.clear();
    approvedItems.clear();
    for (int i = 0; i < item.length; i++) {
      final currentItem = item[i];
      itemActions[i] = QuoteItemAction.approved;
      approvedItems.add(currentItem);
    }
  }

  int _parseInt(dynamic value) {
    if (value is int) return value;
    final raw = (value ?? '').toString().trim();
    return int.tryParse(raw) ?? 0;
  }

  double _parseMoney(dynamic value) {
    if (value is num) return value.toDouble();
    final raw = (value ?? '').toString();
    final cleaned = raw.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleaned) ?? 0;
  }
}
