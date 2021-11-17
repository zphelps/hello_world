import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'User Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  print('I was tapped!');
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/space-x.jpg'),
                ),
                title: Text(
                  'Elon Musk',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'Tesla & Space-X'
                ),
                trailing: Icon(
                  Icons.info_outline_rounded
                )
              ),
            ),
          ),
        ],
      )
    );
  }
}
