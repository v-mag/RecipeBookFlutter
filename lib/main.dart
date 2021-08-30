import 'package:flutter/material.dart';
import 'package:recipebook/providers/Profile.dart';
import 'package:recipebook/screens/Home.dart';
import 'package:recipebook/screens/Login.dart';
import 'package:recipebook/screens/Profile.dart';
import 'package:recipebook/screens/Search.dart';
import 'package:after_layout/after_layout.dart';
import 'package:recipebook/screens/UserRecipes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (final BuildContext context) {
            return Profile();
          }
        )
      ],
      child: MaterialApp(
        title: 'Recipe Book',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Splash(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with AfterLayoutMixin<Splash>{
  Future checkAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    var profile = Provider.of<Profile>(context, listen: false);
    if(token != null && !JwtDecoder.isExpired(token)) {
      profile.isAuthentificated = true;
    } else {
      profile.isAuthentificated = false;
    }

    

    if(profile.isAuthentificated) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MainPage())
      );
    } else {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginScreen())
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkAuthToken();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}


class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedIndex = 0;

  final screens = [
    HomeScreen(),
    SearchScreen(),
    UserRecipesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[this.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "My recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Profile"),
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
