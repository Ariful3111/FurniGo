import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/features/rent_request/repositories/step_one_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RentPropertyTypeController extends GetxController {
  final StepOneRepository stepOneRepository;
  RentPropertyTypeController({required this.stepOneRepository});
  RxString selectedPropertyType = 'Residential'.obs;
  RxString selectedPropertyUse = ''.obs;
  List<String> properType = ['Residential', 'Commercial'];
  List<String> residentialUseOptions = [
    'Short-term Rental',
    'Long-term Residential Leasing',
    'Serviced Apartment',
    'Staff Accommodation',
  ];

  List<String> commercialUseOptions = [
    'Office',
    'Retail Store',
    'Cafe / Restaurant',
    'Hotel / Serviced Apartments',
    'Medical / Clinic',
    'Showroom',
    'Co-working Space',
  ];

  List<String> get properUse {
    if (selectedPropertyType.value == 'Commercial') {
      return commercialUseOptions;
    }
    return residentialUseOptions;
  }

  @override
  void onInit() {
    super.onInit();
    if (residentialUseOptions.isNotEmpty) {
      selectedPropertyUse.value = residentialUseOptions.first;
    }

    ever(selectedPropertyType, (value) {
      if (properUse.isNotEmpty) {
        selectedPropertyUse.value = properUse.first;
      } else {
        selectedPropertyUse.value = '';
      }
    });
  }

  Future<void> submitRentRequestOne() async {
    if (selectedPropertyType.value.isEmpty ||
        selectedPropertyUse.value.isEmpty) {
      ErrorSnackbar.show(description: 'Please fill all the fields');
    } else {
      final response = await stepOneRepository.execute(
        propertyType: selectedPropertyType.value,
        propertyUse: selectedPropertyUse.value,
      );
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) {
          Get.find<RentRequestController>().rentController.position.minScrollExtent;

          Get.find<RentStepController>().currentIndex.value++;
        },
      );
    }
  }
}
