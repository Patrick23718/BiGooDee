import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/customNavBarClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaiementScreen extends StatelessWidget {
  const PaiementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          'Moyen de paiement',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              SvgPicture.asset('icons/carte.svg'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Vous n’avez pas encore de Carte Bancaire enregistrée.',
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
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Ajouter ma carte'.toUpperCase(),
                      style: TextStyle(color: kSecondaryColor, fontSize: 16),
                    ),
                  ),
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      useSafeArea: true,
                      builder: (BuildContext context) {
                        return Expanded(
                          flex: 10,
                          child: AlertDialog(
                            scrollable: true,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  'Données Banquaires',
                                  style: TextStyle(
                                      fontSize: textRegularH2,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: SvgPicture.asset('icons/close.svg'),
                                )
                              ],
                            ),
                            content: Text('GeeksforGeeks'),
                            actions: [
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlatButton(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Text(
                                          'Ajouter ma carte'.toUpperCase(),
                                          style: TextStyle(
                                              color: kSecondaryColor,
                                              fontSize: 16),
                                        ),
                                      ),
                                      color: kPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () async {}),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
