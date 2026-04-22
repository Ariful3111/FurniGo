import 'package:get/get.dart';

enum StepState { done, current, future }

class TimelineStep {
  final String title;
  final StepState state;
  final String? date; // shown only when state == done

  const TimelineStep({
    required this.title,
    required this.state,
    this.date,
  });
}
class SellDetailsController extends GetxController {
  List<String> cardList = ['25144654564', '6546546464', '365465464456'];
  RxString selectedCard = ''.obs;

  List summary = [
    {'title': 'Category',   'value': 'Not specified'},
    {'title': 'Brand',      'value': 'Not specified'},
    {'title': 'Dimensions', 'value': 'Not specified'},
    {'title': 'Age',        'value': 'Not specified'},
    {'title': 'Condition',  'value': '6/6 uploaded'},
  ];

  List<TimelineStep> stepsFor(String? status) {
    switch (status) {
      case 'Offer Accepted':
      case 'Accepted':
      case 'Received':
        return const [
          TimelineStep(title: 'Submitted',   state: StepState.done,    date: 'Dec 10, 2024'),
          TimelineStep(title: 'In review',   state: StepState.done,    date: 'Dec 11, 2024'),
          TimelineStep(title: 'Offer ready', state: StepState.done,    date: 'Dec 12, 2024'),
        ];

      case 'Offer Ready':
        return const [
          TimelineStep(title: 'Submitted',   state: StepState.done,    date: 'Dec 10, 2024'),
          TimelineStep(title: 'In review',   state: StepState.done,    date: 'Dec 11, 2024'),
          TimelineStep(title: 'Offer ready', state: StepState.current),
        ];

      case 'In Review':
      default:
        return const [
          TimelineStep(title: 'Submitted',   state: StepState.done,    date: 'Dec 10, 2024'),
          TimelineStep(title: 'In review',   state: StepState.current),
          TimelineStep(title: 'Offer ready', state: StepState.future),
        ];
    }
  }
}