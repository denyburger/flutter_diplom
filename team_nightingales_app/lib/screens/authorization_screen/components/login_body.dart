import 'package:flutter/material.dart';

import 'button_widget.dart';

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
            ButtonWidget(
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

  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ошибка'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Text('Неверные данные'),
              
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}