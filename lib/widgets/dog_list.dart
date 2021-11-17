import 'package:final_dog_app/models/dog_model.dart';
import "package:flutter/material.dart";

class DogCard extends StatelessWidget {
  late String breed;

  DogCard(this.breed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(breed),
    );
  }
}
