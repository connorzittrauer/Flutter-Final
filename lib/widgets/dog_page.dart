import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'dog_list.dart';
import "../models/dog_model.dart";
import "dart:async";
import "dart:convert";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_dog_app/exceptions.dart';

class DogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DogPageState();
  }
}

class _DogPageState extends State<DogPage> {
  Future<List<Dog>?> getBreedList() async {
    const apiURL = "https://dog.ceo/api/breeds/list/all";

    try {
      final response = await http.get(Uri.parse(apiURL));
      if (response.statusCode == 200) {
        var breedList = <Dog>[];
        for (var breed in json.decode(response.body)["message"].keys) {
          breedList.add(Dog(breed: breed, link: ""));
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
  final String breed;
  const DogRoute({Key? key, required this.breed}) : super(key: key);

  Future<Dog?> getRandomImage() async {
    var API_LINK = 'https://dog.ceo/api/breed/$breed/images/random';
    try {
      final response = await http.get(Uri.parse(API_LINK));
      if (response.statusCode == 200) {}
      return Dog.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(breed.toUpperCase())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DogInfo(
              breed: breed,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<Dog?>(
                    future: getRandomImage(),
                    builder: (context, snapshot) {
                      return CachedNetworkImage(
                        width: 350,
                        height: 350,
                        imageUrl: snapshot.data?.link ?? null.toString(),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const CircularProgressIndicator(),
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DogInfo extends StatelessWidget {
  String breed;
  DogInfo({Key? key, required this.breed}) : super(key: key);

  Future<String?> getWikiInfo() async {
    var query = breed;
    var API_KEY = "";
    Exceptions ex = new Exceptions();
    query = ex.parse(breed);

    final apiURL =
        "https://kgsearch.googleapis.com/v1/entities:search?query=$query&key=$API_KEY&limit=1&indent=True";
    print(apiURL);
    final response = await http.get(Uri.parse(apiURL));
    try {
      if (response.statusCode == 200) {
        return (json.decode(response.body)["itemListElement"][0]["result"]
            ["detailedDescription"]['articleBody']);
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: getWikiInfo(),
        builder: (context, snapshot) {
          return Center(
            child:
                Text(snapshot.data?.toString() ?? "No info to be displayed..."),
          );
        });
  }
}
