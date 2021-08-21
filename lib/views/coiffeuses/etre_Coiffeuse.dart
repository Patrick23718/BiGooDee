import 'package:bigoodee/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EtreCoiffeuse extends StatelessWidget {
  const EtreCoiffeuse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          title: Text(
            'Je veux être coiffeuse',
            style: headingStyle,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: textMediumH1,
            ),
            onPressed: () {
              Get.back();
              // Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Avant de compléter votre profil, l’équipe BIGOODEE vous informe que votre profil sera vérifié par nos soins avant d’être visible auprès des clientes.",
                        style: subHeadingStyle,
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: defaultPadding),
                        child: Image(
                          image: AssetImage('images/layer.png'),
                          height: width * 8,
                        ),
                      ),
                      // SizedBox(height:10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: width * 9,
                          height: buttonHeight,
                          child: FlatButton(
                            child: Text(
                              'OK C\'EST PARTI',
                              style: TextStyle(
                                  color: kSecondaryColor, fontSize: 16),
                            ),
                            color: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {
                              Get.offNamed(
                                  /*'/coiffeuse/home'*/ '/creation-coiffeuse');
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                            },
                          ),
                        ),
                      ),
                    ]))));
  }
}
