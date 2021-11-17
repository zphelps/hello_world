import 'package:flutter/material.dart';
import 'package:hello_world/animal_list.dart';
import 'package:hello_world/dog_model.dart';
import 'package:hello_world/user_profile.dart';

void main() {
  runApp(const MaterialApp(
    home: AnimalList(),
  ));
}

class AnimalProfile extends StatelessWidget {
  const AnimalProfile({required this.dog});

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'Dog Profile',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: NetworkImage('https://g.petango.com/photos/352/1653a7b4-28ec-48f4-863c-d56fe6ce20aa.jpg'),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 30.0,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              dog.name,
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'AGE',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              '${dog.age} years',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'SEX',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              dog.gender,
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'WEIGHT',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              '${dog.weight} lbs',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Icon(
                  Icons.info_outlined,
                  color: Colors.grey[400],
                  size: 18,
                ),
                const SizedBox(width: 5.0),
                Text(
                  'ANIMAL ID: 42957366',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}