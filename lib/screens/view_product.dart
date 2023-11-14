import 'package:flutter/material.dart';
import 'package:inventaris_mobile/models/product.dart';
import 'package:inventaris_mobile/screens/add_product.dart';
import 'package:inventaris_mobile/widgets/drawer.dart';

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
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(products[index].name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(height: 10),
                    Text('Amount: ${products[index].amount}'),
                    const SizedBox(height: 10),
                    Text('Description: ${products[index].description}'),
                    const SizedBox(height: 10),
                    Text('Category: ${products[index].category}'),
                    const SizedBox(height: 10),
                    Text('Price: ${products[index].price}'),
                  ],
                ),
              ));
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
