import 'dart:async';
import 'dart:convert';
import 'dart:collection';
import "package:http/http.dart" as http;

class Dog {
  String breed;

  Dog(this.breed);
}

Future<List<Dog>?> getBreedList() async {
  final apiURL = "https://dog.ceo/api/breeds/list/all";

  try {
    final response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      var breedList = <Dog>[];
      for (var breed in json.decode(response.body)["message"].keys) {
        breedList.add(Dog(breed));
      }
      return breedList;
    }
  } catch (e) {
    return null;
  }
}
