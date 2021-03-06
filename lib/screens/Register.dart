import 'package:flutter/material.dart';
import 'package:recipebook/services/AuthService.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String username, password;

  String? validateUsername(String username) {
    if(username.length > 5) {
      return "Username must have more than 5 characters";
    } else {
      return null;
    }
  }

  String? validatePassword(String password) {
    if(password.length > 8) {
      return "Password must have more than 8 characters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                      )
                  ),
                  onChanged: (value) {
                    username = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                      )
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          AuthService().register(username, password).then((value) {
                            if(value) {
                              Navigator.pop(context);
                            } else {

                            }
                          });
                        },
                        child: Text("Register")
                    ),
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    label: Text("Back to Login")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
