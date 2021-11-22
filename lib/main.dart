import 'package:flutter/material.dart';
import 'package:hello_world/animal_list.dart';
import 'package:hello_world/dog_model.dart';
import 'package:hello_world/user_profile.dart';

void main() {
  runApp(MaterialApp(
    // home: AnimalList(),
    initialRoute: '/',
    routes: {
      '/': (context) => AnimalList(),
      '/animalProfile': (context) => AnimalProfile(),
    },
  ));
}

class AnimalProfile extends StatelessWidget {
  const AnimalProfile();

  @override
  Widget build(BuildContext context) {
    final dogData = ModalRoute.of(context)!.settings.arguments as DogModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'About ${dogData.name}',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: .5,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 150.0,
                backgroundImage: NetworkImage(dogData.imageURL),
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
              dogData.name,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w800,
                fontSize: 24.0,
                // letterSpacing: 2.0,
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
              '${dogData.age} years',
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w800,
                fontSize: 24.0,
                // letterSpacing: 2.0,
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
              dogData.gender,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w800,
                fontSize: 24.0,
                // letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 20.0),
            // const Text(
            //   'WEIGHT',
            //   style: TextStyle(
            //     color: Colors.grey,
            //     letterSpacing: 2.0,
            //     fontSize: 12,
            //   ),
            // ),
            // const SizedBox(height: 5.0),
            // Text(
            //   '${dogData.weight} lbs',
            //   style: TextStyle(
            //     color: Colors.amberAccent[200],
            //     fontWeight: FontWeight.bold,
            //     fontSize: 24.0,
            //     letterSpacing: 2.0,
            //   ),
            // ),
            // const SizedBox(height: 30.0),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.info_outlined,
            //       color: Colors.grey[400],
            //       size: 18,
            //     ),
            //     const SizedBox(width: 5.0),
            //     Text(
            //       'ANIMAL ID: 42957366',
            //       style: TextStyle(
            //         color: Colors.grey[400],
            //         fontSize: 14.0,
            //         letterSpacing: 1.0,
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}