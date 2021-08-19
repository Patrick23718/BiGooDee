import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DiscussionScreen extends StatelessWidget {
  late FocusNode FNPass;
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: ,
        centerTitle: true,
        title: Text(
          'Messages',
          style: headingStyle,
        ),
        leading: IconButton(
          icon: SvgPicture.asset('icons/back.svg'),
          // Icon(
          //   Icons.arrow_back,
          //   color: Colors.black,
          //   size: textMediumH1,
          // ),
          onPressed: () {
            Get.back();
            // Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: TextFormField(
            //     cursorColor: kTextColor,
            //     style: TextStyle(
            //       color: kTextColor,
            //     ),
            //     decoration: InputDecoration(
            //         contentPadding:
            //             EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //         focusedBorder: OutlineInputBorder(
            //             borderSide:
            //                 BorderSide(color: kPrimaryColor, width: 1.0)),
            //         labelText: 'Rechercher un contact',
            //         hintText: 'Rechercher un contact',
            //         labelStyle: TextStyle(
            //             color:
            //                 kTextOnlyColor //FocusScope.of(context).hasFocus ? kPrimaryColor : kTextOnlyColor
            //             ),
            //         hintStyle: TextStyle(
            //           fontSize: textRegularP1,
            //           color: kTextOnlyColor,
            //         ),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(10)),
            //         ),
            //         suffixIcon: Padding(
            //           padding: const EdgeInsets.only(right: 10),
            //           child: Material(
            //             color: kPrimaryColor,
            //             elevation: 2.0,
            //             shadowColor: kPrimaryColor,
            //             borderRadius: BorderRadius.all(Radius.circular(30)),
            //             child: IconButton(
            //               icon: Icon(Icons.search),
            //               onPressed: () {},
            //               constraints:
            //                   BoxConstraints(maxHeight: 35, maxWidth: 35),
            //             ),
            //           ),
            //         ),
            //         suffixIconConstraints:
            //             BoxConstraints(minHeight: 35, minWidth: 35)),
            //   ),
            // ),
            // SizedBox(
            //     // height: ,
            //     ),
            SvgPicture.asset('icons/Lineprimary.svg'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Message(),
                  SizedBox(height: 10),
                  Message(),
                  SizedBox(height: 10),
                  Message(),
                  SizedBox(height: 10),
                  Message(),
                  SizedBox(height: 10),
                  Message(),
                  SizedBox(height: 10),
                  Message()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        // width: width * 9,
        // decoration: BoxDecoration(

        // ),
        padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: kbackColor.withOpacity(0.2),
          border: Border.all(color: kborderColor),
          borderRadius: BorderRadius.circular(10),
          // border: Border(left: BorderSide(color: kWarAlertColor, width: 8)),
          // borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                color: kWarAlertColor,
              ),
              child: SizedBox(
                height: 50,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(backgroundImage: AssetImage('images/profile.png')),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sarah',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    // width: width * 7,
                    child: Text(
                      'Salut Miss sdgs gsd gsdgsd gs dg sdg sd gs dg sdg sdgsd rdytdyt dytd ytd ytdy',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: normalStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '15:40',
                  style: normalStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kPrimaryColor,
                  ),
                  child: Center(
                    child: Text(
                      '5',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kSecondaryColor, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
