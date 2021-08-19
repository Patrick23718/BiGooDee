import 'package:flutter/material.dart';
import 'package:bigoodee/models/Product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 1,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
