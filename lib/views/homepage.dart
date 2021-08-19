import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:bigoodee/components/productTile.dart';
import 'package:bigoodee/controllers/productController.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  var number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        middleText:
                            "souhaitez-vous supprimer définitivement votre compte?",
                      );
                    },
                    icon: Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.grid_view)),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    itemBuilder: (context, index) {
                      return ProductTile(
                          product: productController.productList[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(number));
              }
            }),
          )
        ],
      ),
    );
  }
}
