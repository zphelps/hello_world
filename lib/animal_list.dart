import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/animal_list_tile.dart';
import 'package:hello_world/dog_model.dart';

import 'package:oauth2/oauth2.dart' as oauth2;

class AnimalList extends StatefulWidget {
  const AnimalList({Key? key}) : super(key: key);

  @override
  _AnimalListState createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {

  late Future<List<DogModel>> dogData;

  Future<List<DogModel>> fetchDogData(String query) async {
    try{
      final authorizationEndpoint =
      Uri.parse('https://api.petfinder.com/v2/oauth2/token');

      const identifier = '1NvMYFu5tsDNWhPjE9YN3gfexGpHsRemN84rIlxtxtYwieVUAy';
      const secret = 'hQZNN7oZAvv4Ph9SS5uZQBxDBqjzYNMSSSfU5KsM';

      var client = await oauth2.clientCredentialsGrant(
          authorizationEndpoint, identifier, secret);

      var response =
      await client.read(Uri.parse('https://api.petfinder.com/v2/animals?type=dog&$query&limit=100'));
      // make the request
      // Response response = await get(Uri.parse('https://api.petfinder.com/v2/animals?type=dog&status=adopted'), headers: {
      //   'Authorization': 'Bearer $token',
      // });
      Map data = jsonDecode(response);

      List<DogModel> dogs = [];

      for(dynamic dog in data['animals']) {
        if(dog['photos'].length > 0 && dog['description'] != null) {
          dogs.add(DogModel(
            name: dog['name'],
            imageURL: dog['photos'].length > 0 ? dog['photos'][0]['full'] : 'https://i1.wp.com/fremontgurdwara.org/wp-content/uploads/2020/06/no-image-icon-2.png',
            // breed: dog['breeds'] != null ? dog['breeds']['primary'] : 'Unknown',
            age: dog['age'],
            gender: dog['gender'],
            // description: dog['description'],
          ));
        }
      }
      return dogs;

    }
    catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    dogData = fetchDogData('');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Dogs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: FutureBuilder(
        future: dogData,
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
              // physics: const PageScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return AnimalListTile(dog: snapshot.data[index]);
                }
            );
          }
          else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
      // body: ListView.builder(
      //   itemCount: dogs.length,
      //   itemBuilder: (context, index) {
      //     return AnimalListTile(dog: dogs[index]);
      //     // return Container(
      //     //   margin: const EdgeInsets.all(20),
      //     //   decoration: BoxDecoration(
      //     //     color: Colors.white,
      //     //     borderRadius: BorderRadius.circular(20),
      //     //     boxShadow: [
      //     //       BoxShadow(
      //     //         color: Colors.black.withOpacity(0.25),
      //     //         blurRadius: 24,
      //     //       )
      //     //     ]
      //     //   ),
      //     //   child: Column(
      //     //     children: [
      //     //       Text(
      //     //         dogs[index].name,
      //     //       ),
      //     //       Text(
      //     //         '${dogs[index].weight} lbs',
      //     //       )
      //     //     ],
      //     //   ),
      //     // );
      //   },
      // ),
    );
  }
}
