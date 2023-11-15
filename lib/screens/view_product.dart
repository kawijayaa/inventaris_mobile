import 'package:flutter/material.dart';
import 'package:inventaris_mobile/models/product.dart';
import 'package:inventaris_mobile/screens/add_product.dart';
import 'package:inventaris_mobile/widgets/drawer.dart';
import 'package:inventaris_mobile/widgets/productcard.dart';

class ViewProductPage extends StatefulWidget {
  const ViewProductPage({Key? key}) : super(key: key);

  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Products'),
      ),
      body: (() {
        if (products.isEmpty) {
          return const Center(
            child: Text("No products found!"),
          );
        } else {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(products[index]);
            },
          );
        }
      })(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AddProductPage()));
        },
        child: const Icon(Icons.add),
      ),
      drawer: const LeftDrawer(),
    );
  }
}

List<Product> products = [];