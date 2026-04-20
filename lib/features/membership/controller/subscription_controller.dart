import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class SubscriptionController extends GetxController {
  RxString selectedCard = ''.obs;
  RxBool isActive = true.obs;
  final List<Map<String, dynamic>> plans = [
    {
      "title": "Earlybird Plan",
      "price": "\$4.99",
      "buttonText": "Start Now",
      "isPrimary": false,
      "isPremium": false,
      "isActive": false,
      "isExpire": true,
      "isExpireSoon": false,
      "features": [
        "Free furniture collection pickup",
        "Member-only discounts on rentals",
        "Eligible to bid on refurbished items",
        "Limited-time promotional access",
      ],
    },
    {
      "title": "Design Plan",
      "price": "\$10",
      "buttonText": "Subscribe Now",
      "isPrimary": true,
      "isPremium": false,
      "isActive": false,
      "isExpire": false,
      "isExpireSoon": false,
      "badge": "Most Popular",
      "features": [
        "AI room design & interior concepts",
        "Unlimited design prompts",
        "Priority Support",
        "Priority support",
      ],
    },
    {
      "title": "Collection +",
      "price": "\$79",
      "buttonText": "Go Premium",
      "isPrimary": false,
      "isPremium": true,
      "isExpire": false,
      "isActive": true,
      "isExpireSoon": false,
      "features": [
        "Everything in Design Pro",
        "Free furniture collection & pickup",
        "Maximum discounts on rentals",
        "Early access to premium collections",
        "Priority bidding eligibility",
      ],
    },
  ];
  List<String> membershipPlanFeature = [
    "15% discount on all products",
    "Free delivery & assembly (\$249 value)",
    "Priority customer support",
    "Exclusive early access to sales",
    "Design consultation included",
  ];
  final List<Map<String, String>> membership = [
    {
      "title": "15% Off Everything",
      "desc":
          "Save on our entire collection with exclusive member pricing on all products",
      "icon": IconsPath.subsStar,
    },
    {
      "title": "Free White Glove Delivery",
      "desc": "Complimentary premium delivery service (normally \$249 AUD)",
      "icon": IconsPath.van,
    },
    {
      "title": "Professional Assembly",
      "desc":
          "Expert furniture assembly and setup included with every delivery",
      "icon": IconsPath.gear,
    },
    {
      "title": "Priority Access",
      "desc": "Early access to new collections and exclusive member-only sales",
      "icon": IconsPath.stopwatch,
    },
  ];
}
