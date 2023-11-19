import 'package:flutter/material.dart';
import 'package:inventaris_mobile/screens/add_product.dart';
import 'package:inventaris_mobile/screens/login.dart';
import 'package:inventaris_mobile/screens/view_product.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class HomeButton {
  final String name;
  final IconData icon;
  final Color color;

  HomeButton(this.name, this.icon, this.color);
}

class HomeButtonCard extends StatelessWidget {
  final HomeButton button;

  const HomeButtonCard(this.button, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
        color: button.color,
        child: InkWell(
            onTap: () async {
              if (button.name == 'Add Item') {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProductPage(),
                    ));
              } else if (button.name == 'View Items') {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewProductPage(),
                    ));
              } else if (button.name == "Logout") {
                final response = await request.logout(
                    "http://muhammad-oka-tutorial.pbp.cs.ui.ac.id/auth/logout/");
                String message = response["message"];
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message Good bye, $uname."),
                  ));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message"),
                  ));
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(button.icon, color: Colors.white, size: 30.0),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(button.name,
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            )));
  }
}
