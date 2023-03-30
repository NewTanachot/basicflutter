// import 'dart:io';
// import 'dart:js_util';
import 'package:flutter/material.dart';
import 'FoodMenu.dart';
import 'MoneyBox.dart';
import 'Models.dart';

const appName = "Dev as New";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: const MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

// My Home Page stateful widget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {

  var models;
  Future<void> fetchData() async {
    models = await getDataFromApi();
    setState(() => {});
  }

  @override
  void initState() {
    super.initState();
    
    fetchData();

    print("Call init state.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("$appName - Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            MoneyBox("${models?.userId.toString()}.${models?.title}" , models?.id?.toDouble() ?? 0, Colors.indigo, 100),
            const SizedBox(height: 5),
            MoneyBox("Total Amoung : ", 30000, Colors.blueGrey, 100),
            const SizedBox(height: 5),
            MoneyBox("InCome : ", 1000, Colors.green, 60),
            const SizedBox(height: 5),
            MoneyBox("OutCome : ", 3000, Colors.red, 60),
            const SizedBox(height: 5),
            MoneyBox("Pending : ", 5000, Colors.orange, 60),
          ],
        ),
      ),
    );
  }
}

// Food menu stateful widget
class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodPage> {
  // state variable
  int number = 0;

  @override
  Widget build(BuildContext context) {
    // Get Food Data
    var foods = getFoodMenuData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),

      // body: Center(
      //   // child: Column(
      //   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   //   children: data,
      //   // ),
      //   child: ListView(
      //     children: getData(),
      //   ),
      // ),

      body: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.asset(foods[index].image),
              title:
                  Text(foods[index].name, style: const TextStyle(fontSize: 20)),
              subtitle: Text("Price : ${foods[index].price} Baht"),
              onTap: () => {
                // ignore: avoid_print
                print(foods[index].name)
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: const Icon(Icons.add),
      ),
    );
  }

  // Get Menu data method
  List<FoodMenu> getFoodMenuData() {
    List<FoodMenu> foodData = [
      FoodMenu("Fry Egg", "100", "image/Foods.png"),
      FoodMenu("Raman", "200", "image/Foods.png"),
      FoodMenu("Steak", "300", "image/Foods.png"),
      FoodMenu("Hot Dogs", "400", "image/Foods.png"),
      FoodMenu("Chicken Wing", "500", "image/Foods.png"),
      FoodMenu("Pork Chop", "600", "image/Foods.png"),
      FoodMenu("Ice-Cream", "700", "image/Foods.png"),
      FoodMenu("Matcha", "800", "image/Foods.png"),
      FoodMenu("Thai Tea", "900", "image/Foods.png"),
      FoodMenu("Wing Sabb KFC", "1000", "image/Foods.png"),
    ];
    return foodData;
  }

  // get demo data method
  List<Widget> getData() {
    // Widget data initialize
    List<Widget> data = [];

    // Add data to widgwet
    // data.add(const Image(
    //     image: NetworkImage(
    //         "https://tanachot2000.github.io/My-Resume/New_picture3.jpg")));

    // Count Program
    data.add(ListTile(
      title: const Text(
        "TAP! to increase this number.",
        style: TextStyle(fontSize: 20, color: Colors.indigo),
      ),
      subtitle: Text(
        "The number is : $number",
        style: const TextStyle(color: Colors.blueGrey),
      ),
    ));

    // Dev as New Image
    data.add(Image.asset("image/Foods.png"));

    data.add(const ListTile(
      title: Text(
        "Hi! Dev as New here.",
        style: TextStyle(fontSize: 20, color: Colors.black87),
      ),
      subtitle: Text("I'm FullStack Developer and also a Software Engineer."),
    ));

    for (var i = 1; i <= 10; i++) {
      data.add(ListTile(
        title: Text("Dummy Data No. $i"),
        subtitle: Text("subTitle No. $i"),
      ));
    }

    return data;
  }

  // add function
  void addNumber() {
    setState(() {
      number++;
    });
  }
}
