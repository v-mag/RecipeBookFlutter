import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/providers/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  removeTokenFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          GestureDetector(
            child: Icon(Icons.logout),
            onTap: () {
              removeTokenFromPrefs();
              var profile = Provider.of<Profile>(context, listen: false);
              profile.isAuthentificated = false;
            },
          )
        ],
      ),
      body: Center(
      ),
    );
  }
}
