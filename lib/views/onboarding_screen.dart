import 'package:bigoodee/constants.dart';
import 'package:bigoodee/models/content_model.dart';
import 'package:bigoodee/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  @override
  _onBoardingScreenState createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  int currentIndex = 0;
  late int? isViewed = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Hello'),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/ 8),
                decoration: BoxDecoration(
                    //color: Colors.black
                    ),
                child: Image(
                  image: AssetImage('images/logo.png'),
                  height: MediaQuery.of(context).size.height / 2.3,
                )),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      children: [
                        Text(
                          contents[i].discription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: textRegularH2,
                            color: kTextColor,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                bottom: MediaQuery.of(context).size.height / 8,
                top: MediaQuery.of(context).size.height / 20,
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    child: Text(
                      currentIndex == contents.length - 1
                          ? "CONTINUEZ"
                          : "SUIVANT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textRegularP1,
                      ),
                    ),
                    onPressed: () {
                      if (currentIndex == contents.length - 1) {
                        Get.offNamed('/welcome');
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => WelcomeScreen(),
                        //   ),
                        // );
                      }
                      _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? kPrimaryColor
            : kPrimaryColor.withOpacity(0.4), //Theme.of(context).primaryColor,
      ),
    );
  }
}
