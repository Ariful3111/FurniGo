import 'package:get/get.dart';
import 'package:zb_dezign/features/home/models/rooms_model.dart';
import 'package:zb_dezign/features/home/repositories/get_rooms_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class GetRoomsController extends GetxController {
  final GetRoomsRepository getRoomsRepository;
  GetRoomsController({required this.getRoomsRepository});

  final rooms = Rxn<RoomsModel>();
  RxBool isLoading = true.obs;

  Future<void> getRooms() async {
    final response = await getRoomsRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        rooms.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getRooms();
  }
}
