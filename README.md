# Inventaris - Mobile
#### Muhammad Oka - 2206046784

## Assignment Steps
### Assignment 7

<details>
<summary>Initialize Flutter Project</summary>

1. Create a new project

    ```
    flutter create inventaris_mobile
    cd inventaris_mobile
    flutter run
    ```

</details>

<details>
<summary>Create Menu Page</summary>

1. Modify ```main.dart``` file to include ```menu.dart```

    ```dart
    // lib/main.dart
    import 'package:flutter/material.dart';
    import 'package:inventaris_mobile/menu.dart';

    void main() {
        runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
        const MyApp({super.key});

        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'INVENTARIS',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
                useMaterial3: true,
            ),
            home: HomePage(),
            );
        }
    }    
    ```

2. Create ```menu.dart``` and create the ```HomePage``` widget.

    ```dart
    // lib/menu.dart

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
                        )
                    ),
                )
            );
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
    ```
</details>

## Assignment Essay

<details>
<summary>Assignment 7</summary>

## Stateful vs Stateless Widget

A stateful widget is a widget that can change dynamically. A stateless widget is static and will not change.

## Widgets used in Assignment 7

- ```MyApp```: A widget created as a root for the app.
- ```HomePage```: A widget to create the home page.
- ```SingleChildScrollView```: Creates a box for a widget to be scrolled
- ```Padding```: Widget to add padding for the child.
- ```Column```: Widget to make a column of widgets.
- ```Text```: Widget to create text.
- ```GridView.count```: Widget to create a grid with a fixed amount of tiles.
- ```HomeButtonCard```: Widget to create the button tiles.
- ```Icon```: Widget to create an icon.

</details>