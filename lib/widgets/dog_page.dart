import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'dog_list.dart';
import "../models/dog_model.dart";
import "dart:async";
import "dart:convert";

class PhotoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DogPageState();
  }
}

class _DogPageState extends State<PhotoPage> {
  final apiURL = "https://dog.ceo/api/breeds/list/all";
  var dogFuture;

  Future<List<Dog>?> getBreedList() async {
    var dogFuture;
    try {
      final response = await http.get(Uri.parse(apiURL));
      if (response.statusCode == 200) {
        var breedList = <Dog>[];
        for (var breedJSON in json.decode(response.body)) {
          breedList.add(Dog.fromJSON(breedJSON));
        }
        return breedList;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Dog>?>(
      future: dogFuture,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: (snapshot.data != null) ? snapshot.data!.length : 0,
          itemBuilder: (context, index) {
            return DogCard(snapshot.data![index]);
          },
        );
      },
    );
  }
}
