import 'package:bigoodee/constants.dart';
import 'package:bigoodee/models/Prestation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bigoodee/models/Product.dart';
import 'package:get/get.dart';

class CoiffureTitle extends StatefulWidget {
  final Prestation product;

  const CoiffureTitle({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _CoiffureTitleState createState() => _CoiffureTitleState();
}

class _CoiffureTitleState extends State<CoiffureTitle> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 12;
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {
          Get.defaultDialog(
              backgroundColor: Colors.transparent,
              title: '',
              content: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: widget.product.typePrestation.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      width: width * 6,
                      // height: width * 6,
                      decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(15))),
                      child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.network(
                              apiURL +
                                  '/' +
                                  widget.product.typePrestation[itemIndex]
                                      .photoUrl,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                                top: 150,
                                child: Text(
                                  widget.product.typePrestation[itemIndex].nom,
                                  style: TextStyle(
                                      color: kSecondaryColor,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ))
                          ]),
                    ),
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      // viewportFraction: 0.9,
                      // aspectRatio: 2.0,
                      // initialPage: 2,
                      height: width * 6,

                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      // autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      // enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        print(index);
                        setState(() {
                          _current = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.product.typePrestation.length,
                        (index) => buildDot(_current, context),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      // height: 50,
                      width: double.infinity,
                      child: FlatButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'trouvez votre coiffeuse'.toUpperCase(),
                              style: TextStyle(
                                  color: kSecondaryColor, fontSize: 16),
                            ),
                          ),
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () async {}))
                ],
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    // height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      apiURL + '/' + widget.product.typePrestation[0].photoUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                widget.product.nom.toLowerCase(),
                maxLines: 1,
                style: normalStyle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              // SizedBox(height: 8),
              // // ignore: unnecessary_null_comparison
              // if (product.rate != null)
              //   Container(
              //     decoration: BoxDecoration(
              //         color: Colors.green,
              //         borderRadius: BorderRadius.circular(12)),
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(
              //           product.rate.toString(),
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         Icon(
              //           Icons.star,
              //           size: 16,
              //           color: Colors.white,
              //         )
              //       ],
              //     ),
              //   ),
              // SizedBox(height: 8),
              // Text(
              //   '\$${product.rate}',
              //   style: TextStyle(
              //       fontSize: 32,
              //       fontFamily: 'avenir',
              //       fontWeight: FontWeight.w700),
              // )
            ],
          ),
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
        color: _current == index
            ? kPrimaryColor
            : kPrimaryColor.withOpacity(0.4), //Theme.of(context).primaryColor,
      ),
    );
  }
}
