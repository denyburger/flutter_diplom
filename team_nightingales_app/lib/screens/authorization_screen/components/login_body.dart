import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_nightingales_app/customs/customRoute.dart';
import 'package:team_nightingales_app/screens/start_screen/start.dart';

import 'auth.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isHidenPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              cursorColor: Colors.black,
              controller: _loginController,
              maxLength: 30,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black87),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(15)),
                icon: const Icon(Icons.login, color: Colors.black87),
                labelText: "Login",
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              cursorColor: Colors.black87,
              style: const TextStyle(
                color: Colors.black,
              ),
              controller: _passwordController,
              maxLength: 30,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(15)),
                labelStyle: TextStyle(color: Colors.black87),
                icon: const Icon(
                  Icons.lock,
                  color: Colors.black87,
                ),
                labelText: "Password",
                counterText: "",
                suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                    child: const Icon(
                      Icons.visibility,
                      color: Colors.black87,
                    )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              obscureText: isHidenPassword,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[700],
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            onPressed: () async {
              UserModel loginUser = await AuthClass()
                  .authMethod(_loginController.text, _passwordController.text);
              // if (loginUser != null) {
              //   Navigator.push(
              //       context, MyRoute(builder: (context) => StartPage()));
              // }
            },
            child: Text('Log In'),
          )
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidenPassword = !isHidenPassword;
    });
  }
}
