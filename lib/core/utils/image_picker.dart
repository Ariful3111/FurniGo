import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class ImageManager {
  static Future<XFile?> sendImage({
    required ImagePicker picker,
    required Rxn<XFile> pickImage,
    required BuildContext context,
  }) async {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final completer = Completer<XFile?>();
    bool selectionInProgress = false;
    await Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                selectionInProgress = true;
                Get.back();
                try {
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 25,
                  );
                  if (!completer.isCompleted) completer.complete(image);
                  if (image != null) pickImage.value = image;
                } catch (_) {
                  if (!completer.isCompleted) completer.complete(null);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                selectionInProgress = true;
                Get.back();
                try {
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 25,
                  );
                  if (!completer.isCompleted) completer.complete(image);
                  if (image != null) pickImage.value = image;
                } catch (_) {
                  if (!completer.isCompleted) completer.complete(null);
                }
              },
            ),
          ],
        ),
      ),
    );
    if (!selectionInProgress && !completer.isCompleted) {
      completer.complete(null);
    }
    return completer.future;
  }

  static Future<String?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    if (image == null) {
      return null;
    } else {
      return image.path;
    }
  }

  static Future<String?> captureImageViaCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo == null) {
      return null;
    } else {
      return photo.path;
    }
  }

  static Future<List<String>> pickMultipleImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage(
      limit: 5,
      imageQuality: 25,
    );
    if (images.isEmpty) {
      return [];
    } else {
      List<String> allImages = [];
      for (var element in images) {
        allImages.add(element.path);
      }
      return allImages;
    }
  }
}