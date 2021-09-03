import 'dart:io';

import 'package:bigoodee/constants.dart';
import 'package:bigoodee/helpers/local_storage.dart';
import 'package:bigoodee/middlewares/Authenticated.dart';
import 'package:bigoodee/services/userServices.dart';
import 'package:bigoodee/theme.dart';
import 'package:bigoodee/views/clientes/cgu_Screen.dart';
import 'package:bigoodee/views/clientes/coiffeuse_prefere_screen.dart';
import 'package:bigoodee/views/clientes/confirmation_compte_screen.dart';
import 'package:bigoodee/views/clientes/gestion_mot_passe_screen.dart';
import 'package:bigoodee/views/clientes/home_screen.dart';
import 'package:bigoodee/views/clientes/paiement_screen.dart';
import 'package:bigoodee/views/clientes/profile_cliente.dart';
import 'package:bigoodee/views/clientes/settings_screen.dart';
import 'package:bigoodee/views/coiffeuses/ajout_prestion_init_screen.dart';
import 'package:bigoodee/views/coiffeuses/biographie_screen.dart';
import 'package:bigoodee/views/coiffeuses/creation_compte_coiffeuse_screen.dart';
import 'package:bigoodee/views/coiffeuses/register_coiffeuse_screen.dart';
import 'package:bigoodee/views/coiffeuses/welcome_screen.dart';
import 'package:bigoodee/views/inscription_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
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
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:shared_preferences/shared_preferences.dart';

late String? test;
const String LOCAL_STEPPERS_COMPLETED = "initApp";
UserServices _userServices = UserServices();

User? user;

void main() async {
  setUpAll(() {
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{}; // set initial values here if desired
      }
      return null;
    });
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  test = prefs.getString(LOCAL_STEPPERS_COMPLETED);
  prefs.setString(LOCAL_STEPPERS_COMPLETED, 'false');

  print('Get $LOCAL_STEPPERS_COMPLETED As $test');
  // var box = Hive.box('bigoodee');
  // Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // var box = await Hive.openBox('bigoodee');

  // box.put(LOCAL_STEPPERS_COMPLETED, '1');
  // var name = box.get(LOCAL_STEPPERS_COMPLETED);

  // print('Name: $name');

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kPrimaryColor,
    statusBarIconBrightness: Brightness.light,
  ));

  // user = _userServices.getUser();

  // _userServices.getRole(user!.uid.toString());
  runApp(MyApp());
}

void setUpAll(Null Function() param0) {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bigoodee',
      debugShowCheckedModeBanner: false,
      initialRoute: test == 'false' ? '/connexion' : '/',
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
            middlewares: [FirstMiddleware()]
            /*, transition: Transition.lf*/
            ),
        GetPage(name: '/cliente/profile', page: () => ProfileClientScreen()),
        GetPage(name: '/cliente/confirm', page: () => ConfirmCompescreen()),
        GetPage(name: '/cliente/register', page: () => InscriptionScreen()),
        GetPage(name: '/cliente/settings', page: () => SettingsScreen()),
        GetPage(name: '/cliente/cgu', page: () => CGUScreen()),
        GetPage(name: '/cliente/paiement', page: () => PaiementScreen()),
        GetPage(
            name: '/cliente/passmanege', page: () => GestionMotPasseScreen()),
        GetPage(
            name: '/client/whistlist', page: () => CoiffeusePrefereScreen()),
        GetPage(name: '/creation', page: () => CreationCompteScreen()),
        GetPage(
            name: '/creation-coiffeuse',
            page: () => CreationCompteCoiffeuseScreen()),
        GetPage(
            name: '/coiffeuse/register', page: () => RegisterCoiffeuseScreen()),
        GetPage(name: '/coiffeuse/getstarted', page: () => WelcomePageScreen()),
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
            name: '/coiffeuse/addprestationsinit',
            page: () => AjoutPrestationInitScreen()),
        GetPage(
            name: '/coiffeuse/notifications', page: () => NotificationScreen()),
        GetPage(
            name: '/coiffeuse/portemonnaie', page: () => PorteMonnaieScreen())
      ],
      theme: theme(),
    );
  }
}
