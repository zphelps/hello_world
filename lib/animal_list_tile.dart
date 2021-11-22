import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/dog_model.dart';

class AnimalListTile extends StatelessWidget {
  const AnimalListTile({required this.dog});

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/animalProfile', arguments: dog);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        // height: 330,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: dog.imageURL,
                fit: BoxFit.fitWidth,
                height: 242,
                width: MediaQuery.of(context).size.width,
              ),
              // child: Image(
              //   image: NetworkImage(dog.imageURL),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dog.name,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      const Text(
                        'Weight: ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      // Text(
                      //   '${dog.weight} lbs',
                      //   style: const TextStyle(
                      //     color: Colors.grey,
                      //     fontSize: 13,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Text(
                        'Age: ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      Text(
                        '${dog.age} years',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Text(
                        'Gender: ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      Text(
                        dog.gender,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                blurRadius:6,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              )
            ]
        ),
      ),
    );
  }
}
