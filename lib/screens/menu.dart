import 'package:flutter/material.dart';
import 'package:inventaris_mobile/widgets/homebutton.dart';
import 'package:inventaris_mobile/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<HomeButton> buttons = [
    HomeButton('View Items', Icons.view_list, Colors.blue),
    HomeButton('Add Item', Icons.add, Colors.green),
    HomeButton('Logout', Icons.logout, Colors.red)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('INVENTARIS'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text('Welcome to INVENTARIS!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  GridView.count(
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: buttons.map((HomeButton button) {
                        return HomeButtonCard(button);
                      }).toList(),
                    )
                ],
              )),
        ),
        drawer: const LeftDrawer(),
      );
  }
}