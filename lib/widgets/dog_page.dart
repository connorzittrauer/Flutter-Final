import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'dog_list.dart';
import "../models/dog_model.dart";
import "dart:async";
import "dart:convert";

class DogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DogPageState();
  }
}

class _DogPageState extends State<DogPage> {
  Future<List<Dog>> getBreedList() async {
    const apiURL = "https://dog.ceo/api/breeds/list/all";

    final response = await http.get(Uri.parse(apiURL));

    if (response.statusCode == 200) {
      var breedList = <Dog>[];
      for (var breed in json.decode(response.body)["message"].keys) {
        breedList.add(Dog(breed: breed, link: ""));
      }
      return breedList;
    } else {
      throw Exception('Failed to load dog');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Dog>?>(
      future: getBreedList(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: (snapshot.data != null) ? snapshot.data!.length : 0,
          itemBuilder: (context, index) {
            return DogCard(snapshot.data![index].breed);
          },
        );
      },
    );
  }
}

//need way to get currently selected dog
class DogRoute extends StatelessWidget {
  String breed;
  DogRoute({Key? key, required this.breed}) : super(key: key);

  Future<Dog> getRandomImage() async {
    var API_LINK = 'https://dog.ceo/api/breed/$breed/images/random';
    print(breed);
    final response = await http.get(Uri.parse(API_LINK));

    if (response.statusCode == 200) {
      return Dog.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to dog pic');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Dog?>(
        future: getRandomImage(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(title: Text(breed)),
            body: Center(
              child: Image.network(snapshot.data!.link),
            ),
          );
        });
  }
}
