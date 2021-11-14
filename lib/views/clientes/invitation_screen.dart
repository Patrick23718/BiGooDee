// import 'dart:html';

import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/customNavBarClient.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  _InvitationScreenState createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          'Invites tes amies',
          style: headingStyle,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        leading: IconButton(
          icon: SvgPicture.asset('icons/back.svg'),
          onPressed: () {
            Get.back();
            // Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      ),
      bottomNavigationBar:
          CustomBottomNavBarClient(selectedMenu: MenuState.profile),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('icons/invitation.svg'),
              SizedBox(
                height: 40,
              ),
              Text(
                "Gagnes 5€ quand tes amis réservent leurs premières prestation.",
                style: normalStyleText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                // height: 50,
                width: double.infinity,
                child: FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'ouvrir mon espace'.toUpperCase(),
                        style: TextStyle(color: kSecondaryColor, fontSize: 16),
                      ),
                    ),
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                          title: 'envoyer par :',
                          contentPadding: EdgeInsets.only(top: 30),
                          content: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon:
                                        SvgPicture.asset('icons/whatsapp.svg'),
                                    onPressed: () async {
                                      var whatsapp = "+237655602173";
                                      var whatsappURl_android =
                                          "whatsapp://send?phone=" +
                                              whatsapp +
                                              "&text=Laissez nous un message";
                                      var whatappURL_ios =
                                          "https://wa.me/$whatsapp?text=${Uri.parse("Laissez nous un message")}";

                                      // android , web
                                      if (await canLaunch(
                                          whatsappURl_android)) {
                                        await launch(whatsappURl_android);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: new Text(
                                                    "whatsapp non installé")));
                                      }

                                      // Navigator.of(context).pop();
                                    },
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset('icons/mail.svg'),
                                    onPressed: () async {
                                      var mail = "noukimi.patrick@gmail.com";
                                      var mailURl_android = "mailto:" +
                                          mail +
                                          "&text=Merci de nous avoir contacter";
                                      // var whatappURL_ios =
                                      //     "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

                                      // android , web
                                      if (await canLaunch(mailURl_android)) {
                                        await launch(mailURl_android);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: new Text(
                                                    "Mail non installé")));
                                      }
                                      // Navigator.of(context).pop();
                                    },
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'icons/messenger.svg',
                                    ),
                                    onPressed: () async {
                                      var messenger = "patricknoukimi79";
                                      var messengerURl_android =
                                          "facebook://" + messenger;
                                      // var whatappURL_ios =
                                      //     "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

                                      // android , web
                                      if (await canLaunch(
                                          messengerURl_android)) {
                                        await launch(messengerURl_android);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: new Text(
                                                    "Messenger non installé")));
                                      }

                                      // Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    // height: 50,
                                    width: double.infinity,
                                    child: FlatButton(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Text(
                                            'annuler'.toUpperCase(),
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                        color: kbackColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        })),
                              )
                            ],
                          ));
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                    }),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "offre valable pour chaque nouveau membre que tu invites. partages vite cette bonne nouvelle.",
                style: normalStyleText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
