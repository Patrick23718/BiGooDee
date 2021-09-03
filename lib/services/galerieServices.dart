import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:bigoodee/constants.dart';
import 'package:bigoodee/models/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class GalerieService extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  void getImage(ImageSource imageSource, String uid) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // Crop
      final cropImageFile = await ImageCropper.cropImage(
          sourcePath: selectedImagePath.value,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          // cropStyle: CropStyle.circle,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Redimensionnez l\'image',
              toolbarColor: kPrimaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              hideBottomControls: false,
              activeControlsWidgetColor: kPrimaryColor,
              lockAspectRatio: false),
          // maxWidth: 512,
          // maxHeight: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // Compress

      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + "/temp.jpg";
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          cropImagePath.value, targetPath,
          quality: 90);
      compressImagePath.value = compressedFile!.path;
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      //uploadImage(compressedFile, uid);
      print(
          'La nouvelle taille est de $compressImageSize / $selectedImageSize');
    } else {
      Get.snackbar('Alerte', 'Aucune Image selectionnée',
          // snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kWarAlertColor.withOpacity(0.5),
          colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void uploadImage(File file, String uid) {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    ImageUploadProvider().uploadImage1(file.path, uid).then((resp) {
      Get.back();
      // if (resp == "success") {
      //   Get.snackbar('Success', 'File Uploaded',
      //       backgroundColor: Colors.green.withOpacity(0.5),
      //       colorText: Colors.white);
      // } else if (resp == "fail") {
      //   Get.snackbar('Error', 'File upload failed 1',
      //       // snackPosition: SnackPosition.BOTTOM,
      //       backgroundColor: Colors.red.withOpacity(0.5),
      //       colorText: Colors.white);
      // }
      print(resp.toString());
      Get.snackbar('Alerte', 'Aucune Image selectionnée',
          // snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kPrimaryColor.withOpacity(0.5),
          colorText: Colors.white);
    }, onError: (err) {
      Get.back();
      print(err.toString());
      Get.snackbar('Alerte', 'Aucune Image selectionnée',
          // snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kWarAlertColor.withOpacity(0.5),
          colorText: Colors.white);
    });
  }
}

class ImageUploadProvider extends GetConnect {
  Future<http.StreamedResponse> uploadImage1(
      String filePath, String uid) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(apiURL + "/galerie/" + uid));
    request.files.add(await http.MultipartFile.fromPath('photoURL', filePath));
    request.fields['uid'] = uid;
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    var response = request.send();
    print(response);
    return response;
  }

  //Upload Image
  Future<String> uploadImage(File file, String uid) async {
    try {
      final form = FormData({
        'uid': uid,
        'photoURL': MultipartFile(file, filename: 'aa.jpg'),
      });

      final response = await post(apiURL + "/galerie/" + uid, form);
      print(response);
      if (response.status.hasError) {
        return Future.error(response.body);
      } else {
        return response.body['result'];
      }
    } catch (exception) {
      print(exception);
      return Future.error(exception.toString());
    }
  }
}
