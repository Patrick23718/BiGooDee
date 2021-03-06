import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:bigoodee/helpers/functions.dart';
import 'package:bigoodee/services/galerieServices.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GalerieScreen extends StatefulWidget {
  const GalerieScreen({Key? key}) : super(key: key);

  @override
  _GalerieScreenState createState() => _GalerieScreenState();
}

class _GalerieScreenState extends State<GalerieScreen> {
  UserServices _userServices = UserServices();
  GalerieService _galerieService = GalerieService();

  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = _userServices.getUser();
    // if (user == null) {
    //   Get.offAllNamed('/connexion');
    // }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Ma Galerie',
          style: headingStyle,
        ),
        leading: IconButton(
          icon: SvgPicture.asset('icons/back.svg'),
          onPressed: () {
            Get.back();
            // Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset('icons/Bell.svg'))
        ],
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.planning,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Vous pouvez ajouter ou supprimer une image de votre galerie ?? tous moment',
                style: normalStyleText,
              ),
              SizedBox(height: 20),
              Center(
                  child: Wrap(spacing: 20, runSpacing: 20, children: [
                GalerieImage(assetName: 'images/galerie1.png'),
                GalerieImage(
                  assetName: 'images/galerie2.png',
                ),
                GalerieImage(
                  assetName: 'images/galerie3.png',
                ),
                GalerieImage(
                  assetName: 'images/galerie4.png',
                ),
              ])),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: FlatButton(
                    child: Text(
                      'Ajouter une image'.toUpperCase(),
                      style: TextStyle(color: kSecondaryColor, fontSize: 16),
                    ),
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Get.bottomSheet(
                          Container(
                            child: Wrap(children: [
                              ListTile(
                                leading: Icon(Icons.camera_alt_outlined),
                                title: Text(
                                  'Appareil Photo',
                                  style: TextStyle(
                                    fontSize:
                                        textRegularP1, //getProportionateScreenWidth(28),
                                    color: kTextTitleColor,
                                  ),
                                ),
                                onTap: () async {
                                  var pickedFile = _galerieService.getImage(
                                      ImageSource.camera, user!.uid);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.image),
                                title: Text(
                                  'Gal??rie',
                                  style: TextStyle(
                                    fontSize:
                                        textRegularP1, //getProportionateScreenWidth(28),
                                    color: kTextTitleColor,
                                  ),
                                ),
                                onTap: () async {
                                  var pickedFile = _galerieService.getImage(
                                      ImageSource.gallery, user!.uid);
                                },
                              )
                            ]),
                          ),
                          backgroundColor: kSecondaryColor);
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalerieImage extends StatelessWidget {
  final String assetName;

  const GalerieImage({Key? key, required this.assetName}) : super(key: key);
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          // decoration: BoxDecoration(
          //     // borderRadius: B
          //     ),
          color: null,
          width: width * 4.5,
          child: Image(
            image: AssetImage(assetName),
          ),
        ),
        Positioned(
            bottom: width * 2.5,
            top: width * -2,
            left: width * 3,
            right: width * -1.5,
            child: Center(
                child: InkWell(
              onTap: () {
                Get.defaultDialog(
                    titlePadding: EdgeInsets.all(0),
                    title: '',
                    radius: 10,
                    middleText:
                        'Souhaitez-vous supprimer cette image de votre galerie ?',
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          height: buttonHeight,
                          child: OutlinedButton(
                            child: Text(
                              'CONFIRMER',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 16),
                            ),

                            style: OutlinedButton.styleFrom(
                                side:
                                    BorderSide(width: 1, color: kPrimaryColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),

                            // color: kSecondaryColor,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            onPressed: () {
                              Get.offNamed('/coiffeuse/home');
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          height: buttonHeight,
                          width: 130,
                          child: FlatButton(
                            child: Text(
                              'ANNULER',
                              style: TextStyle(
                                  color: kSecondaryColor, fontSize: 16),
                            ),
                            color: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {
                              Get.back();
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                            },
                          ),
                        ),
                      ),
                    ]);
              },
              child: Container(
                child: IconButton(
                  icon: SvgPicture.asset('icons/delete.svg'),
                  onPressed: () {},
                ),
              ),
            )))
      ],
    );
  }
}
