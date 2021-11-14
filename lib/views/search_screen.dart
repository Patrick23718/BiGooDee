import 'package:bigoodee/constants.dart';
import 'package:bigoodee/enums.dart';
import 'package:bigoodee/helpers/customNavBarClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    double height = MediaQuery.of(context).size.height / 12;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          title: Text(
            'résultats de la recherche',
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
        bottomNavigationBar: CustomBottomNavBarClient(
          selectedMenu: MenuState.home,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: height * 7,
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    itemCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 100,
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              // top: -20,
                              child: Image(
                                image: AssetImage('images/logos.png'),
                                height: 20,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
              ),
            ],
          ),
        )));
  }
}
