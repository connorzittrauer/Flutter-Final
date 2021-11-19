import 'package:final_dog_app/widgets/dog_page.dart';
import "package:flutter/material.dart";

class DogCard extends StatelessWidget {
  late String breed;

  DogCard(this.breed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.pets),
              title: Text(breed.toUpperCase()),
              subtitle:
                  Text('Press View Images to see a picture of this breed'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'View Images',
                    style: TextStyle(color: Colors.lightGreenAccent),
                  ),
                  //needs to go to a new route with image
                  onPressed: () {
                    //could have one template class route, and simply pass the breed
                    // print(breed);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DogRoute(breed: breed)));
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
