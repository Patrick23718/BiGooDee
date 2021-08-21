import 'package:bigoodee/constants.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/theme.dart';
import 'package:bigoodee/views/clientes/confirmation_compte_screen.dart';
import 'package:bigoodee/views/clientes/home_screen.dart';
import 'package:bigoodee/views/coiffeuses/biographie_screen.dart';
import 'package:bigoodee/views/coiffeuses/creation_compte_coiffeuse_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:bigoodee/views/coiffeuses/ajout_prestation.dart';
import 'package:bigoodee/views/coiffeuses/discussions.dart';
import 'package:bigoodee/views/coiffeuses/etre_Coiffeuse.dart';
import 'package:bigoodee/views/coiffeuses/galerie.dart';
import 'package:bigoodee/views/coiffeuses/home_coiffeuse.dart';
import 'package:bigoodee/views/coiffeuses/mon_porte_monnaie.dart';
import 'package:bigoodee/views/coiffeuses/notification.dart';
import 'package:bigoodee/views/coiffeuses/planning.dart';
import 'package:bigoodee/views/coiffeuses/prestation.dart';
import 'package:bigoodee/views/coiffeuses/profile.dart';
import 'package:bigoodee/views/connexion_screen.dart';
import 'package:bigoodee/views/creation_compte_screen.dart';
import 'package:bigoodee/views/onboarding_screen.dart';
import 'package:bigoodee/views/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bigoodee/views/homepage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

UserServices _userServices = UserServices();
final storage = GetStorage();

User? user;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kPrimaryColor,
    statusBarIconBrightness: Brightness.light,
  ));
  try {
    await GetStorage.init();
  } catch (err) {
    print('object err $err');
  }
  user = _userServices.getUser();

  _userServices.getRole(user!.uid.toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bigoodee',
      debugShowCheckedModeBanner: false,
      initialRoute: '/connexion',
      getPages: [
        GetPage(name: '/', page: () => onBoardingScreen()),
        GetPage(name: '/welcome', page: () => WelcomeScreen()),
        GetPage(
          name: '/getstarted',
          page: () => EtreCoiffeuse(),
          /*, transition: Transition.lf*/
        ),
        GetPage(name: '/cliente/accueil', page: () => HomeClient()),
        GetPage(
          name: '/connexion',
          page: () => ConnexionScreen(),
          /*, transition: Transition.lf*/
        ),
        GetPage(name: '/cliente/confirm', page: () => ConfirmCompescreen()),
        GetPage(name: '/creation', page: () => CreationCompteScreen()),
        GetPage(
            name: '/creation-coiffeuse',
            page: () => CreationCompteCoiffeuseScreen()),
        GetPage(name: '/coiffeuse/home', page: () => AccueilCoffeuse()),
        GetPage(name: '/coiffeuse/planning', page: () => PlanningScreen()),
        GetPage(name: '/coiffeuse/message', page: () => DiscussionScreen()),
        GetPage(name: '/coiffeuse/profile', page: () => ProfileScreen()),
        GetPage(name: '/coiffeuse/galerie', page: () => GalerieScreen()),
        GetPage(name: '/coiffeuse/prestations', page: () => PrestationScreen()),
        GetPage(name: '/biographie', page: () => BiographieScreen()),
        GetPage(
            name: '/coiffeuse/addprestations',
            page: () => AjoutPrestationScreen()),
        GetPage(
            name: '/coiffeuse/notifications', page: () => NotificationScreen()),
        GetPage(
            name: '/coiffeuse/portemonnaie', page: () => PorteMonnaieScreen())
      ],
      theme: theme(),
    );
  }
}
