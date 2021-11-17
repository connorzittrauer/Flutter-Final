import 'package:final_dog_app/models/dog_model.dart';
import "package:flutter/material.dart";

class DogCard extends StatelessWidget {
  final Dog pup;

  DogCard(this.pup, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      child: Card(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
              child: Text(pup.breed!),
            ),
          ],
        ),
      ),
    );
  }
}
