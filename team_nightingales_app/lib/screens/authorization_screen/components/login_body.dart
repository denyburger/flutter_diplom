import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_nightingales_app/screens/home_screen.dart';
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
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _loginController,
              maxLength: 30,
              decoration: InputDecoration(
                icon: const Icon(Icons.login),
                labelText: "Login",
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(
                color: Colors.amber,
              ),
              controller: _passwordController,
              maxLength: 30,
              decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                labelText: "Password",
                counterText: "",
                suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                    child: const Icon(Icons.visibility)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              obscureText: isHidenPassword,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async{
                UserModel loginUser = await AuthClass().authMethod(_loginController.text, _passwordController.text);
                if(loginUser !=null){
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => StartPage()));
                }
              },
              child: Text('Log In'),
            )
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidenPassword = !isHidenPassword;
    });
  }
}