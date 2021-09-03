// import 'package:shared_preferences/shared_preferences.dart';

import 'package:bigoodee/constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Functions {
  // getdata() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getString('displayName');
  //   prefs.getInt('counter');
  //   prefs.getDouble('double');
  //   prefs.getBool('valid');

  //   prefs.setString('displayName', '' /*user.displayName*/);
  //   prefs.setInt('counter', 6);
  //   prefs.setDouble('double', 20.1);
  //   prefs.setBool('valid', true);

  //   prefs.remove('displayName');
  // }
  Future<PickedFile?> getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
    } else {
      Get.snackbar('Alerte', 'Aucune image n\'a été selectionnée.',
          animationDuration: Duration(seconds: 3),
          colorText: kSecondaryColor,
          backgroundColor: kWarAlertColor.withOpacity(0.4));
    }
    return pickedFile;
  }
}
