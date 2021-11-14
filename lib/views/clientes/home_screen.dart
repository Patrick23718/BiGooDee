import 'package:bigoodee/components/coiffureTile.dart';
import 'package:bigoodee/constants.dart';
import 'package:bigoodee/controllers/prestationController.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/customNavBarClient.dart';
import 'package:bigoodee/models/Prestation.dart';
import 'package:bigoodee/models/Ville.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/services/villeServices.dart';
import 'package:bigoodee/views/coiffeuses/planning.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeClient extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);
  @override
  _HomeClientState createState() => _HomeClientState();
}

class _HomeClientState extends State<HomeClient> {
  // final PrestationController productController =
  //     Get.put(PrestationController());
  UserServices _userServices = UserServices();
  late Future<Ville?> _ville;
  int toggle = 0;
  String villeValue = "Choix de la ville";
  String prestationValue = "Type de prestation";
  String dateValue = "Choix de votre date";
  List<String> prestations = [
    "braids",
    "fulani braids",
    "vanilles (twista)",
    "CORNROWS",
    "NAttes collées",
    "fulani braids",
    "BANTU KNOTS",
    "SENEGALESE TWIST",
    "PIQUÉS LÂCHÉS",
    "crochet braids",
    "TISSAGES",
    "FAUSSES LOCKS",
    "LISSAGES",
    "soins",
    "lace frontal",
    "brushing",
    "tresses enfants",
    "coupes",
    "chignon",
    "coupes enfants",
    "balayage",
    "locks",
    "pose perruque",
  ];
  List<String> disponibiliteList = ["08h - 12h", "12h - 18h", "18h - 22h"];
  List<Prestation> prestationsList = [
    Prestation(nom: "BRAIDS", typePrestation: [
      TypePrestations(
          nom: "BRAIDS COURTES",
          photoUrl: "uploads/2021-09-01T02-16-25.470ZBRAIDS COURTES.jpeg"),
      TypePrestations(
          nom: "BRAIDS LONGUES",
          photoUrl: "uploads/2021-09-01T02-16-38.897ZBRAIDS LONGUES.jpeg"),
    ]),
    Prestation(nom: 'FULANI BRAIDS', typePrestation: [
      TypePrestations(
          nom: 'FULANI BRAIDS',
          photoUrl: "uploads/2021-09-01T02-21-34.891ZFULANI BRAIDS.jpeg")
    ]),
    Prestation(nom: "VANILLES (TWISTS)", typePrestation: [
      TypePrestations(
          nom: "VANILLES",
          photoUrl: "uploads/2021-09-01T02-21-09.122ZVANILLES.jpeg")
    ]),
    Prestation(nom: "CORNROWS", typePrestation: [
      TypePrestations(
          nom: "CORNROWS",
          photoUrl: "uploads/2021-09-01T02-14-27.235ZCORNROWS.jpeg")
    ]),
    Prestation(nom: "BANTU KNOTS", typePrestation: [
      TypePrestations(
          nom: "BANTU KNOTS",
          photoUrl: "uploads/2021-09-01T02-15-32.053ZBANTU KNOTS.jpeg")
    ]),
    Prestation(nom: "SENEGALESE TWIST", typePrestation: [
      TypePrestations(
          nom: "SENEGALESE TWIST",
          photoUrl: "uploads/2021-09-01T02-22-14.552ZSENEGALESE TWISTS.jpeg")
    ]),
    Prestation(nom: "PIQUÉS LÂCHÉS", typePrestation: [
      TypePrestations(
          nom: "PIQUÉS LÂCHÉS",
          photoUrl: "uploads/2021-09-01T02-17-27.409ZPIQUÉ LÂCHÉ.jpeg")
    ]),
    Prestation(nom: "TISSAGES", typePrestation: [
      TypePrestations(
          nom: "TISSAGES",
          photoUrl: "uploads/2021-09-01T02-19-19.084ZTISSAGE.jpeg")
    ]),
    Prestation(nom: "FAUSSES LOCKS", typePrestation: [
      TypePrestations(
          nom: "FAUSSES LOCKS",
          photoUrl: "uploads/2021-09-01T02-12-49.822ZFAUSSES LOCKS.jpeg")
    ]),
    Prestation(nom: "LISSAGES", typePrestation: [
      TypePrestations(
          nom: "LISSAGES",
          photoUrl: "uploads/2021-09-01T02-19-46.982ZLISSAGE.jpeg")
    ]),
    Prestation(nom: "COUPES", typePrestation: [
      TypePrestations(
          nom: "COUPES",
          photoUrl: "uploads/2021-09-01T02-22-48.140ZCOUPES.jpeg")
    ])
  ];

  Widget? TypePrestation(String text, String? icon) {
    var check = false.obs;
    double width = MediaQuery.of(context).size.width / 12;
    return Obx(() => InkWell(
          onTap: () {
            check.value = !check.value;
          },
          child: Container(
            // height: width * 1.8,
            width: width * 12,
            // margin: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                  color: (check.value) ? kPrimaryColor : kTextOnlyColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'icons/hair.svg',
                        color: (check.value) ? kPrimaryColor : null,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: textRegularP1,
                          color: kTextOnlyColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    // padding: ,
                    child: SvgPicture.asset((check.value)
                        ? 'icons/check.svg'
                        : 'icons/uncheck.svg'),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget? InputPrestation(String text, String? icon, bool test) {
    var check = false.obs;
    double width = MediaQuery.of(context).size.width / 12;
    return Obx(() => InkWell(
          onTap: () {
            check.value = !check.value;
            setState(() {
              if (test) {
                prestationValue = text;
              } else {
                villeValue = text;
              }
            });
            Get.back();
          },
          child: Column(
            children: [
              Container(
                // height: width * 1.8,
                width: width * 12,
                // margin: EdgeInsets.only(left: 10, right: 10),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: (check.value) ? kPrimaryColor : kTextOnlyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              icon != ""
                                  ? SvgPicture.asset(
                                      icon!,
                                      color:
                                          (check.value) ? kPrimaryColor : null,
                                    )
                                  : SvgPicture.asset(
                                      "icons/hair.svg",
                                      color:
                                          (check.value) ? kPrimaryColor : null,
                                    ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                text,
                                style: TextStyle(
                                  fontSize: textRegularP1,
                                  color: kTextOnlyColor,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            // padding: ,
                            child: SvgPicture.asset((check.value)
                                ? 'icons/check.svg'
                                : 'icons/uncheck.svg'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }

  User? user;
  late FocusNode myFocusNod;
  final _nomController = TextEditingController();
  @override
  void initState() {
    toggle = 0;
    myFocusNod = FocusNode();

    // prestationsList =
    // TODO: implement initState
    // _ville = VilleService().getVille();
    // print(productController.prestationList[1]);
    super.initState();
    user = _userServices.getUser();
    // if (user == null) {
    //   Get.offAllNamed('/connexion');
    // }
  }

  @override
  void dispose() {
    _nomController.dispose();
    myFocusNod.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNod);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    double height = MediaQuery.of(context).size.height / 12;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined))
        ],
      ),
      bottomNavigationBar:
          CustomBottomNavBarClient(selectedMenu: MenuState.home),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                // height: height*3,
                color: kSecondaryColor,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/logos.png'),
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bonjour ${user!.displayName!.split('%')[0].split(' ')[0]},",
                        style: headingStyle,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: Container(
                // height: height * 7,
                color: kPrimaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      "Découvrez et reservez la coiffeuse qui vous correspond !",
                      style: TextStyle(
                        fontSize:
                            textRegularP1, //getProportionateScreenWidth(28),
                        color: kSecondaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        // color: kSecondaryColor,
                        decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: FlatButton(
                                        child: Text(
                                          'Je reserve ma coiffeuse',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: kSecondaryColor,
                                              fontSize: 12),
                                        ),
                                        color: toggle == 0
                                            ? kPrimaryColor
                                            : kbackColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            toggle = 0;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: FlatButton(
                                        child: Text(
                                          'Je découvre les coiffures',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: kSecondaryColor,
                                              fontSize: 12),
                                        ),
                                        color: toggle == 1
                                            ? kPrimaryColor
                                            : kbackColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            toggle = 1;
                                          });
                                        },
                                      ),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: toggle == 0
                                  ? Column(
                                      children: [
                                        Container(
                                          // height: width * 1.8,
                                          width: double.infinity,
                                          // margin: EdgeInsets.only(left: 10, right: 10),
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: kTextOnlyColor),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Get.defaultDialog(
                                                  title: '',
                                                  titlePadding:
                                                      EdgeInsets.all(0),
                                                  content: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            'Choisissez votre ville',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    textRegularH2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          IconButton(
                                                            onPressed: () =>
                                                                Get.back(),
                                                            icon: SvgPicture.asset(
                                                                'icons/close.svg'),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      SizedBox(
                                                        child: InputPrestation(
                                                            'Nantes',
                                                            'icons/build.svg',
                                                            false),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      SizedBox(
                                                        child: InputPrestation(
                                                            'Rennes',
                                                            'icons/build.svg',
                                                            false),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      SizedBox(
                                                        child: InputPrestation(
                                                            'Lille',
                                                            'icons/build.svg',
                                                            false),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'si votre ville ne fait pas partie des villes proposées, n\'hésitez pas à proposer votre ville en suggestion',
                                                        style: normalStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10),
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: buttonHeight,
                                                          child: FlatButton(
                                                            child: Text(
                                                              'valider'
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  color:
                                                                      kSecondaryColor,
                                                                  fontSize: 16),
                                                            ),
                                                            color:
                                                                kPrimaryColor,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            onPressed: () {
                                                              Get.back();
                                                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      // SizedBox(
                                                      //   height: inputInterligne,
                                                      // ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10),
                                                        child: SizedBox(
                                                          height: buttonHeight,
                                                          width:
                                                              double.infinity,
                                                          child: OutlinedButton(
                                                            child: Text(
                                                              'proposer une ville'
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  color:
                                                                      kPrimaryColor,
                                                                  fontSize: 16),
                                                            ),
                                                            style: OutlinedButton
                                                                .styleFrom(
                                                                    side: BorderSide(
                                                                        width:
                                                                            1,
                                                                        color:
                                                                            kPrimaryColor),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    )),
                                                            onPressed: () {
                                                              Get.back();
                                                              Get.defaultDialog(
                                                                  title: '',
                                                                  titlePadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  content: Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                            Text(
                                                                              'suggérer sa ville',
                                                                              style: TextStyle(fontSize: textRegularH2, fontWeight: FontWeight.w500),
                                                                            ),
                                                                            IconButton(
                                                                              onPressed: () => Get.back(),
                                                                              icon: SvgPicture.asset('icons/close.svg'),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          'rentrer la ville dans laquelle vous sollicitez les sevices d’une coiffeuse.',
                                                                          style:
                                                                              normalStyle,
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Container(
                                                                          child: Form(
                                                                              key: _formKey,
                                                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                                                                TextFormField(
                                                                                  controller: _nomController,
                                                                                  focusNode: myFocusNod,
                                                                                  onTap: _requestFocus,
                                                                                  cursorColor: kTextColor,
                                                                                  style: TextStyle(
                                                                                    color: kTextColor,
                                                                                  ),
                                                                                  decoration: InputDecoration(
                                                                                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor, width: 1.0)),
                                                                                    labelText: 'nom de la ville',
                                                                                    hintText: 'nom de la ville',
                                                                                    labelStyle: TextStyle(color: myFocusNod.hasFocus ? kPrimaryColor : kTextOnlyColor //FocusScope.of(context).hasFocus ? kPrimaryColor : kTextOnlyColor
                                                                                        ),
                                                                                    hintStyle: TextStyle(
                                                                                      fontSize: textRegularP1,
                                                                                      color: kTextOnlyColor,
                                                                                    ),
                                                                                    border: OutlineInputBorder(
                                                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                    ),
                                                                                  ),
                                                                                  validator: (String? value) {
                                                                                    if (value == null || value.isEmpty) {
                                                                                      return 'Veuillez renseigner le nom de la ville';
                                                                                    }
                                                                                    return null;
                                                                                  },
                                                                                ),
                                                                                SizedBox(height: 10),
                                                                                SizedBox(
                                                                                    // height: 50,
                                                                                    width: double.infinity,
                                                                                    child: FlatButton(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                                                                          child: Text(
                                                                                            'valider'.toUpperCase(),
                                                                                            style: TextStyle(color: kSecondaryColor, fontSize: 16),
                                                                                          ),
                                                                                        ),
                                                                                        color: kPrimaryColor,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          if (_formKey.currentState!.validate()) {}
                                                                                        }))
                                                                              ])),
                                                                        )
                                                                      ]));
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ));
                                            },
                                            highlightColor:
                                                kPrimaryColor.withOpacity(0.2),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                      SvgPicture.asset(
                                                          'icons/map.svg'),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text(
                                                        villeValue,
                                                        style: TextStyle(
                                                          fontSize:
                                                              textRegularP1,
                                                          color: kTextOnlyColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                      // padding: ,
                                                      child: SvgPicture.asset(
                                                          'icons/Vector.svg'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          // height: width * 1.8,
                                          width: double.infinity,
                                          // margin: EdgeInsets.only(left: 10, right: 10),
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: kTextOnlyColor),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Get.defaultDialog(
                                                  title: '',
                                                  titlePadding:
                                                      EdgeInsets.all(0),
                                                  content: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            'Type de prestation',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    textRegularH2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          IconButton(
                                                            onPressed: () =>
                                                                Get.back(),
                                                            icon: SvgPicture.asset(
                                                                'icons/close.svg'),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        height: height * 6,
                                                        child: StaggeredGridView
                                                            .countBuilder(
                                                                crossAxisCount:
                                                                    1,
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    prestations
                                                                        .length,
                                                                mainAxisSpacing:
                                                                    5,
                                                                crossAxisSpacing:
                                                                    5,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return SizedBox(
                                                                    child: InputPrestation(
                                                                        prestations[index]
                                                                            .toUpperCase(),
                                                                        "",
                                                                        true),
                                                                  );
                                                                },
                                                                staggeredTileBuilder:
                                                                    (index) =>
                                                                        StaggeredTile.fit(
                                                                            1)),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10),
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: buttonHeight,
                                                          child: FlatButton(
                                                            child: Text(
                                                              'valider'
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  color:
                                                                      kSecondaryColor,
                                                                  fontSize: 16),
                                                            ),
                                                            color:
                                                                kPrimaryColor,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            onPressed: () {
                                                              Get.back();
                                                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ));
                                            },
                                            highlightColor:
                                                kPrimaryColor.withOpacity(0.2),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                      SvgPicture.asset(
                                                        'icons/hair.svg',
                                                        width: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text(
                                                        prestationValue,
                                                        style: TextStyle(
                                                          fontSize:
                                                              textRegularP1,
                                                          color: kTextOnlyColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                      // padding: ,
                                                      child: SvgPicture.asset(
                                                          'icons/Vector.svg'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          // height: width * 1.8,
                                          width: double.infinity,
                                          // margin: EdgeInsets.only(left: 10, right: 10),
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: kTextOnlyColor),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Get.defaultDialog(
                                                  title: 'Choix de la date',
                                                  titlePadding:
                                                      EdgeInsets.all(0),
                                                  // titlePadding:
                                                  //     EdgeInsets.all(10),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: Column(
                                                            children: [
                                                              TableCalendar(
                                                                focusedDay:
                                                                    selectedDay,
                                                                firstDay:
                                                                    DateTime(
                                                                        1990),
                                                                lastDay:
                                                                    DateTime(
                                                                        2050),
                                                                calendarFormat:
                                                                    format,
                                                                onFormatChanged:
                                                                    (CalendarFormat
                                                                        _format) {
                                                                  setState(() {
                                                                    format =
                                                                        _format;
                                                                  });
                                                                },
                                                                startingDayOfWeek:
                                                                    StartingDayOfWeek
                                                                        .sunday,
                                                                daysOfWeekVisible:
                                                                    true,

                                                                //Day Changed
                                                                onDaySelected: (DateTime
                                                                        selectDay,
                                                                    DateTime
                                                                        focusDay) async {
                                                                  setState(() {
                                                                    selectedDay =
                                                                        selectDay;
                                                                    focusedDay =
                                                                        focusDay;
                                                                  });
                                                                  print(
                                                                      focusedDay);
                                                                },
                                                                selectedDayPredicate:
                                                                    (DateTime
                                                                        date) {
                                                                  return isSameDay(
                                                                      selectedDay,
                                                                      date);
                                                                },

                                                                //To style the Calendar
                                                                calendarStyle:
                                                                    CalendarStyle(
                                                                  isTodayHighlighted:
                                                                      true,
                                                                  selectedDecoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        kPrimaryColor,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    // borderRadius: BorderRadius.circular(5.0),
                                                                  ),
                                                                  selectedTextStyle:
                                                                      TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                  todayDecoration:
                                                                      BoxDecoration(
                                                                    color: kPrimaryColor
                                                                        .withOpacity(
                                                                            0.5),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    // borderRadius: BorderRadius.circular(5.0),
                                                                  ),
                                                                  defaultDecoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    // borderRadius: BorderRadius.circular(5.0),
                                                                  ),
                                                                  weekendDecoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    // borderRadius: BorderRadius.circular(5.0),
                                                                  ),
                                                                ),
                                                                headerStyle:
                                                                    HeaderStyle(
                                                                  formatButtonVisible:
                                                                      false,
                                                                  titleCentered:
                                                                      true,
                                                                  formatButtonShowsNext:
                                                                      false,
                                                                  formatButtonDecoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .blue,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  formatButtonTextStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      30.0),
                                                          child: Divider(
                                                              thickness: 1.5),
                                                        ),
                                                        // SizedBox(
                                                        //   height: inputInterligne,
                                                        // ),
                                                        Text(
                                                          'choisis ta plage horaire',
                                                          style: normalStyle,
                                                        ),
                                                        Container(
                                                          height: height * 1.9,
                                                          child: OverflowBox(
                                                            child: StaggeredGridView
                                                                .countBuilder(
                                                                    crossAxisCount:
                                                                        2,
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemCount:
                                                                        disponibiliteList
                                                                            .length,
                                                                    mainAxisSpacing:
                                                                        5,
                                                                    crossAxisSpacing:
                                                                        5,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Container(
                                                                          child:
                                                                              RaisedButton(
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          disponibiliteList[
                                                                              index],
                                                                          style:
                                                                              normalStyle,
                                                                        ),
                                                                      ));
                                                                    },
                                                                    staggeredTileBuilder:
                                                                        (index) =>
                                                                            StaggeredTile.fit(1)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ));
                                            },
                                            highlightColor:
                                                kPrimaryColor.withOpacity(0.2),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                      SvgPicture.asset(
                                                        'icons/calandar.svg',
                                                        width: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text(
                                                        dateValue,
                                                        style: TextStyle(
                                                          fontSize:
                                                              textRegularP1,
                                                          color: kTextOnlyColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                      // padding: ,
                                                      child: SvgPicture.asset(
                                                          'icons/Vector.svg'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Center(
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: buttonHeight,
                                              child: FlatButton(
                                                child: Text(
                                                  'rechercher'.toUpperCase(),
                                                  style: TextStyle(
                                                      color: kSecondaryColor,
                                                      fontSize: 16),
                                                ),
                                                color: kPrimaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                onPressed: () {
                                                  Get.toNamed('/search');
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      height: height * 4.9,
                                      child: StaggeredGridView.countBuilder(
                                          crossAxisCount: 2,
                                          shrinkWrap: true,
                                          itemCount: prestationsList.length,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              child: CoiffureTitle(
                                                  product:
                                                      prestationsList[index]),
                                            );
                                          },
                                          staggeredTileBuilder: (index) =>
                                              StaggeredTile.fit(1)),
                                    ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
// class InputPrestation extends StatelessWidget {
//   final String text;

//   final String? icon;

//   const InputPrestation({Key? key, required this.text, this.icon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var check = false.obs;
//     double width = MediaQuery.of(context).size.width / 12;
//     return Obx(() => InkWell(
//           onTap: () {
//             check.value = !check.value;
//           },
//           child: Column(
//             children: [
//               Container(
//                 // height: width * 1.8,
//                 width: width * 12,
//                 // margin: EdgeInsets.only(left: 10, right: 10),
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       color: (check.value) ? kPrimaryColor : kTextOnlyColor),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: <Widget>[
//                               icon != null
//                                   ? SvgPicture.asset(
//                                       icon!,
//                                       color:
//                                           (check.value) ? kPrimaryColor : null,
//                                     )
//                                   : SvgPicture.asset(
//                                       "icons/hair.svg",
//                                       color:
//                                           (check.value) ? kPrimaryColor : null,
//                                     ),
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Text(
//                                 text,
//                                 style: TextStyle(
//                                   fontSize: textRegularP1,
//                                   color: kTextOnlyColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Container(
//                             // padding: ,
//                             child: SvgPicture.asset((check.value)
//                                 ? 'icons/check.svg'
//                                 : 'icons/uncheck.svg'),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               )
//             ],
//           ),
//         ));
//   }
// }

// class TypePrestation extends StatelessWidget {
//   final String text;
//   final String icon;

//   const TypePrestation({Key? key, required this.text, required this.icon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var check = false.obs;
//     double width = MediaQuery.of(context).size.width / 12;
//     return Obx(() => InkWell(
//           onTap: () {
//             check.value = !check.value;
//           },
//           child: Container(
//             // height: width * 1.8,
//             width: width * 12,
//             // margin: EdgeInsets.only(left: 10, right: 10),
//             height: 50,
//             decoration: BoxDecoration(
//               border: Border.all(
//                   color: (check.value) ? kPrimaryColor : kTextOnlyColor),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: <Widget>[
//                       SvgPicture.asset(
//                         'icons/hair.svg',
//                         color: (check.value) ? kPrimaryColor : null,
//                       ),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       Text(
//                         text,
//                         style: TextStyle(
//                           fontSize: textRegularP1,
//                           color: kTextOnlyColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     // padding: ,
//                     child: SvgPicture.asset((check.value)
//                         ? 'icons/check.svg'
//                         : 'icons/uncheck.svg'),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
