import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zb_dezign/core/utils/image_picker.dart';

class SellFlowPhotosController extends GetxController {
  final ImagePicker picker = ImagePicker();
  RxList<XFile?> images = List<XFile?>.filled(6, null).obs;
  final isProductPhotosExpanded = true.obs;
  final additionalPhotos = <XFile>[].obs;
  final isExpanded = true.obs;
  final purchasePriceController = TextEditingController();
  final purchaseDateController = TextEditingController();
  final receiptImages = <XFile?>[].obs;

  @override
  void onClose() {
    purchasePriceController.dispose();
    purchaseDateController.dispose();
    super.onClose();
  }

  bool hasImages() {
    return receiptImages.isNotEmpty;
  }

  bool allPhotosUploaded() {
    return images.every((image) => image != null);
  }

  int uploadedPhotosCount() {
    return images.where((image) => image != null).length;
  }

  void pickSingleImage(int index, context) async {
    final Rxn<XFile> temp = Rxn<XFile>();

    final image = await ImageManager.sendImage(
      picker: picker,
      pickImage: temp,
      context: context,
    );

    if (image != null) {
      images[index] = image;
      images.refresh();
    }
  }

  void pickAdditionalPhoto({required BuildContext context}) async {
    final Rxn<XFile> temp = Rxn<XFile>();
    final image = await ImageManager.sendImage(
      picker: picker,
      pickImage: temp,
      context: context,
    );

    if (image != null) {
      additionalPhotos.add(image);
    }
  }

  void removeAdditionalPhoto(int index) {
    additionalPhotos.removeAt(index);
  }

  Future<void> pickReceiptImage({required BuildContext context}) async {
    final Rxn<XFile> temp = Rxn<XFile>();
    final image = await ImageManager.sendImage(
      picker: picker,
      pickImage: temp,
      context: context,
    );
    if (image != null) {
      receiptImages.add(image);
    }
  }

  Future<void> pickFromGalleryDirectly() async {
    final String? imagePath = await ImageManager.pickImageFromGallery();
    if (imagePath != null) {
      receiptImages.add(XFile(imagePath));
    }
  }

  Future<void> captureImage() async {
    final String? imagePath = await ImageManager.captureImageViaCamera();
    if (imagePath != null) {
      receiptImages.add(XFile(imagePath));
    }
  }

  void removeReceiptImage(int index) {
    receiptImages.removeAt(index);
  }
}
