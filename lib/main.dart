import 'package:final_dog_app/widgets/dog_list.dart';
import 'package:final_dog_app/widgets/dog_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Breeds"),
        ),
        body: DogPage(),
      ),
      initialRoute: '/',
      routes: {
        '/route': (context) => DogRoute(
              breed: "akita",
            )
      },
    );
  }
}
