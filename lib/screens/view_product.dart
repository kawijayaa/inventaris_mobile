import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
  Future<List<Product>> fetchProduct() async {
    var url = Uri.parse('http://localhost:8000/products/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // decode the response to JSON
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // convert the JSON to Product object
    List<Product> products = [];
    for (var d in data) {
      if (d != null) {
        products.add(Product.fromJson(d));
      }
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('View Products'),
      ),
      body: FutureBuilder(
          future: fetchProduct(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return const Column(
                  children: [
                    Text(
                      "No product data available.",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => ProductCard(
                          snapshot.data![index],
                        ));
              }
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
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
