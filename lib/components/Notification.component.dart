import 'package:bigoodee/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationComponent extends StatelessWidget {
  final String icon;
  final String name;
  final String texte;
  final String time;

  const NotificationComponent(
      {Key? key,
      required this.name,
      required this.texte,
      required this.icon,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 10,
                  // offset: Offset(4, 5),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(flex: 2, child: SvgPicture.asset(icon)),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: textRegularH2,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(texte,
                              // overflow: TextOverflow.ellipsis,
                              style: normalStyleText
                              // TextStyle(
                              //     color: Colors.black,
                              //     fontSize: textRegularH2,
                              //     fontWeight: FontWeight.w500),
                              )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Text(
                time,
                textAlign: TextAlign.end,
              )
            ],
          )),
      secondaryActions: <Widget>[
        Container(
          width: 10,
          child: InkWell(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset('icons/corbeille.svg'),
                ],
              )
            ]),
            onTap: () {
              Get.defaultDialog(
                  titlePadding: EdgeInsets.all(0),
                  title: '',
                  radius: 10,
                  middleText: 'Souhaitez-vous supprimer cette notification ?',
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
                              side: BorderSide(width: 1, color: kPrimaryColor),
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
                            style:
                                TextStyle(color: kSecondaryColor, fontSize: 16),
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
          ),
        )
        // IconSlideAction(
        //   caption: 'Archive',
        //   color: Colors.blue,
        //   icon: Icons.archive,
        //   onTap: () => null,
        // ),
        // IconSlideAction(
        //   caption: 'Share',
        //   color: Colors.indigo,
        //   icon: Icons.share,
        //   onTap: () => null,
        // ),
      ],
    );
  }
}
