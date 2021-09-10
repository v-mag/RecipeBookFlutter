import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipebook/providers/Profile.dart';
import 'package:recipebook/screens/Register.dart';
import 'package:recipebook/services/AuthService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String username, password;

  String? validateUsername(String username) {
    if(username.length > 5) {
      return "Username must have more than 5 characters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text("to your recipe book app", style: TextStyle(fontSize: 25.0)),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(
                  )
                ),
                onChanged: (value) {
                  username = value;
                },
                validator: (value) {
                  value!.isEmpty ? 'Username is required' : validateUsername(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(

                    )
                ),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  value!.isEmpty ? "Password is required" : null;
                }
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: Text("Login"),
                      onPressed: () {
                        AuthService().login(username, password).then((value) => {
                          if(value) {
                            Provider.of<Profile>(context, listen: false).isAuthentificated = true
                          }
                        });
                      }
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New to RecipeBook ? "),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                    },
                    child: Text("Register", style: TextStyle(color: Colors.amber)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
