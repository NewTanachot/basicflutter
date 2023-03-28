import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  // state variable
  int number = 0;

  @override
  Widget build(BuildContext context) {

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
    data.add(Image.asset("image/DevAsNew.png"));

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

    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: data,
        // ),
        child: ListView(
          children: data,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: const Icon(Icons.add),
      ),
    );
  }

  // add function
  void addNumber() {
    setState(() {
      number++;
    });
  }
}
