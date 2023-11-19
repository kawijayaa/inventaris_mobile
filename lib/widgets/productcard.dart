import 'package:flutter/material.dart';
import 'package:inventaris_mobile/models/product.dart';
import 'package:inventaris_mobile/screens/product_detail.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product))),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(product.fields.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 10),
              Text('Amount: ${product.fields.amount}'),
              const SizedBox(height: 10),
              Text('Description: ${product.fields.description}'),
            ],
          ),
        ),
      ),
    );
  }
}
