import 'package:bigoodee/components/Notification.component.dart';
import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          title: Text(
            'Notifications',
            style: headingStyle,
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
        bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.planning,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                NotificationComponent(
                  icon: 'icons/validate.svg',
                  name: 'Lénnie sonfack',
                  texte:
                      'réservation confirmée : braids courtes (46€) pour le 15/08/2020 entre 15h-18h.',
                  time: 'il y\'a 3 jours',
                ),
                SizedBox(height: 20),
                NotificationComponent(
                  icon: 'icons/rating.svg',
                  name: 'Lénnie sonfack',
                  texte: 'a laissé un avis sur votre profile',
                  time: 'il y\'a 4 jours',
                ),
                SizedBox(height: 20),
                NotificationComponent(
                  icon: 'icons/notifMassage.svg',
                  name: 'Lénnie sonfack',
                  texte:
                      'salut francoise, j\áimerai que tu me dises si tu à les mèches pour les coiffures',
                  time: 'il y\'a 1 jours',
                ),
                SizedBox(height: 20),
                NotificationComponent(
                  icon: 'icons/cancel.svg',
                  name: 'Lénnie sonfack',
                  texte:
                      'réservation annulée : braids courtes (46€) pour le 15/08/2020 entre 15h-18h.',
                  time: 'il y\'a 2 jours',
                ),
                SizedBox(height: 20),
                NotificationComponent(
                  icon: 'icons/notifReservation.svg',
                  name: 'Lénnie sonfack',
                  texte:
                      'Nouvelle réservation : braids courtes (46€) pour le 15/08/2020 entre 15h-18h.',
                  time: 'il y\'a 2 jours',
                ),
              ],
            ),
          ),
        ));
  }
}
