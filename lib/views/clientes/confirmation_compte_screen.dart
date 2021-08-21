import 'package:bigoodee/constants.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmCompescreen extends StatefulWidget {
  const ConfirmCompescreen({Key? key}) : super(key: key);

  // final String name;

  @override
  _ConfirmCompescreenState createState() => _ConfirmCompescreenState();
}

class _ConfirmCompescreenState extends State<ConfirmCompescreen> {
  UserServices _userServices = UserServices();
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = _userServices.getUser();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 100,
        //   centerTitle: true,
        //   title: Text(
        //     'Renseigner mon compte',
        //     style: headingStyle,
        //   ),
        //   leading: IconButton(

        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //       size: textMediumH1,
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        //   backgroundColor: Colors.transparent,
        //   bottomOpacity: 0,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage('images/coiffeuse_1.png'),
                          height: width * 12,
                        ),
                      ),
                      (user == null)
                          ? Text(
                              "Vous devez vous connecter",
                              style: subHeadingStyle,
                            )
                          : Text(
                              "Votre espace client est prêt ${user!.displayName} !",
                              style: subHeadingStyle,
                            ),
                      SizedBox(height: 30),
                      (user != null)
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                // height: 40,
                                width: double.infinity,
                                child: FlatButton(
                                  child: Text(
                                    'JE DECOUVRE MON ESPACE',
                                    style: TextStyle(
                                        color: kSecondaryColor, fontSize: 16),
                                  ),
                                  color: kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    Get.offAllNamed('/cliente/accueil');
                                  },
                                ),
                              ),
                            )
                          : Text(''),
                    ]))));
  }
}
