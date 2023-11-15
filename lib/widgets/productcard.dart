import 'package:flutter/material.dart';
import 'package:inventaris_mobile/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(product.name,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 10),
            Text('Amount: ${product.amount}'),
            const SizedBox(height: 10),
            Text('Description: ${product.description}'),
            const SizedBox(height: 10),
            Text('Category: ${product.category}'),
            const SizedBox(height: 10),
            Text('Price: ${product.price}'),
          ],
        ),
      )
    );
  }
}
