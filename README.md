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

### Assignment 8

<details>
<summary>Create widgets and screen from Lab</summary>

1. Make the left drawer widget

    ```dart
    import 'package:flutter/material.dart';
    import 'package:inventaris_mobile/screens/add_product.dart';
    import 'package:inventaris_mobile/screens/menu.dart';
    import 'package:inventaris_mobile/screens/view_product.dart';
    // import 'package:inventaris_mobile/screens/shoplist_form.dart';

    class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
        child: ListView(
            children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                color: Colors.indigo,
                ),
                child: Column(
                children: [
                    Text(
                    'INVENTARIS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                    "Write all your shopping needs here!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                    ),
                    ),
                ],
                ),
            ),
            ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home Page'),
                // redirect to MyHomePage
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(),
                    ));
                },
            ),
            ListTile(
                leading: const Icon(Icons.view_list),
                title: const Text('View Products'),
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewProductPage(),
                    ));
                },
            ),
            ListTile(
                leading: const Icon(Icons.add_shopping_cart),
                title: const Text('Add Product'),
                // redirect to ShopFormPage
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const AddProductPage(),
                    ),
                );
                },
            ),
            ],
        ),
        );
    }
    }

    ```

2. Create Home Button widget

    ```dart
    import 'package:flutter/material.dart';
    import 'package:inventaris_mobile/screens/add_product.dart';
    import 'package:inventaris_mobile/screens/view_product.dart';

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
            return Material(
                color: button.color,
                child: InkWell(
                    onTap: () {
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
                            )
                        );
                    } else {
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(
                            content: Text("You pressed the ${button.name} button!"),
                            ),
                        );
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
    ```

3. Make the menu screen

    ```dart
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
    ```

4. Create Product model

    ```dart
    class Product {
        final String name;
        final int amount;
        final String description;
        final String category;
        final int price;

        Product(this.name, this.amount, this.description, this.category, this.price);
    }
    ```

5. Create Add Product screen

    ```dart
    import 'package:flutter/material.dart';
    import 'package:inventaris_mobile/models/product.dart';
    import 'package:inventaris_mobile/widgets/drawer.dart';
    import 'package:inventaris_mobile/screens/view_product.dart';

    class AddProductPage extends StatefulWidget {
    const AddProductPage({super.key});

    @override
    State<AddProductPage> createState() => _AddProductPageState();
    }

    class _AddProductPageState extends State<AddProductPage> {
    final _formKey = GlobalKey<FormState>();

    String _name = "";
    int _amount = 0;
    String _description = "";
    String _category = "";
    int _price = 0;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Center(
                child: Text(
                'Add Product',
                ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _name = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Name cannot be empty!";
                        }
                        return null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Amount",
                        labelText: "Amount",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _amount = int.parse(value!);
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Amount cannot be empty!";
                        }
                        if (int.tryParse(value) == null) {
                        return "Amount must be a number!";
                        }
                        return null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _description = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Description cannot be empty!";
                        }
                        return null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Category",
                        labelText: "Category",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _category = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Category cannot be empty!";
                        }
                        return null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Price",
                        labelText: "Price",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _price = int.parse(value!);
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Price cannot be empty!";
                        }
                        if (int.tryParse(value) == null) {
                        return "Price must be a number!";
                        }
                        return null;
                    },
                    ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.indigo),
                        ),
                        onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            showDialog(
                            context: context,
                            builder: (context) {
                                products.add(Product(_name, _amount, _description,
                                    _category, _price));
                                return AlertDialog(
                                title: const Text('Product successfully saved'),
                                content: SingleChildScrollView(
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text('Name: $_name'),
                                        Text('Amount: $_amount'),
                                        Text('Description: $_description'),
                                        Text('Category: $_category'),
                                        Text('Price: $_price'),
                                    ],
                                    ),
                                ),
                                actions: [
                                    TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ViewProductPage()));
                                    },
                                    ),
                                ],
                                );
                            },
                            );
                            _formKey.currentState!.reset();
                        }
                        },
                        child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                        ),
                    ),
                    ),
                ),
                ]),
            ),
            ));
    }
    }
    ```

</details>

<details>

<summary>Bonus: Create page to list the products created</summary>

1. Create View Product screen

    ```dart
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

<details>
<summary>Assignment 8</summary>

## Navigator.push() vs Navigator.pushReplacement()

The difference is, push() will push the screen to the top of the stack. pushReplacement() will replace the screen on top of the stack.

## Layout widgets in Flutter

- Drawer: Used as a navigation menu.
- Form: Used to handle user form input and form validation.
- TextFormField: Used for the user to input text.
- AlertDialog: Used to notify the user.

## Form Input Elements

```TextFormField``` are used so that the user can input any text, and then we validate the input per specification.

## Clean Architecture in Flutter

In Flutter, we divide the application into three layers: Presentation, Domain, and Data. The presentation layer handles the UI and user interaction. The domain layer is used to fetch the required data from the data layer and send it to the presentation layer.

</details>