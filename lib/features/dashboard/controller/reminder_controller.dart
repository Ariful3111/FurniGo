import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/dashboard/models/reminder_model.dart';

class ReminderController extends GetxController {
  final reminder = Rxn<ReminderModel>();
  final RxList<ReminderModel> reminderList = <ReminderModel>[
    ReminderModel(
      title: 'Upcoming Installment Payment',
      sub:
          'Your first monthly installment is due in 3 days. Pay on time to avoid service interruption.',
      time: 'Oct 15, 2025 - 11:30 pm',
      icon: IconsPath.notification,
    ),
    ReminderModel(
      title: 'Upcoming Installment Payment',
      sub:
          'Your first monthly installment is due in 3 days. Pay on time to avoid service interruption.',
      time: 'Oct 15, 2025 - 11:30 pm',
      icon: IconsPath.notification,
    ),
    ReminderModel(
      title: 'Quote Under Review',
      sub:
          'Your first monthly installment is due in 3 days. Pay on time to avoid service interruption.',
      time: 'Oct 15, 2025 - 11:30 pm',
      icon: IconsPath.notification,
    ),
    ReminderModel(
      title: 'Quote Under Review',
      sub:
          'Your first monthly installment is due in 3 days. Pay on time to avoid service interruption.',
      time: 'Oct 15, 2025 - 11:30 pm',
      icon: IconsPath.notification,
    ),
  ].obs;

  @override
  void onInit() {
    reminderList;
    super.onInit();
  }
}
