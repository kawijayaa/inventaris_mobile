import 'package:flutter/material.dart';

class HomeButton {
  final String name;
  final IconData icon;
  final Color color;

  HomeButton(this.name, this.icon, this.color);
}

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
        ));
  }
}

class HomeButtonCard extends StatelessWidget {
  final HomeButton button;

  const HomeButtonCard(this.button, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: button.color,
      child: InkWell(
        onTap:() {
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text("You pressed the ${button.name} button!"),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(button.icon, color: Colors.white, size: 30.0),
              const Padding(padding: EdgeInsets.all(3)),
              Text(button.name, style: const TextStyle(color: Colors.white)),
            ],
          ),
        )
      )
    );
  }
}