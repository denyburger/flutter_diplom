import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:team_nightingales_app/screens/start_screen/start.dart';
import '../../news_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Future login() async {
  //   var url = "http://10.0.2.2:8000/Flutter/loginform.php";
  //   var response = await http.post(Uri.parse(url), body: {
  //     "username": _loginController.text,
  //     "password": _passwordController.text
  //   });
  //   if (response.statusCode == 200) {
  //     var userData = json.decode(response.body);
  //     if (userData == "Ошибка") {
  //       showDialog(
  //           context: (context),
  //           builder: (context) => AlertDialog(
  //                 title: Text('Сообщение'),
  //                 content: Text('Логин и пароль неверны'),
  //                 actions: <Widget>[
  //                   MaterialButton(color: Colors.black54,
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },child: Text("Закрыть"),)
  //                 ],
  //               ));
  //     }
  //     else{
  //       if(userData ['role'] == 'Admin'){
  //         Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
  //       }
  //       showDialog(
  //           context: (context),
  //           builder: (context) => AlertDialog(
  //                 title: Text('Сообщение'),
  //                 content: Text('Успешно!'),
  //                 actions: <Widget>[
  //                   MaterialButton(color: Colors.black54,
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },child: Text("Закрыть"),)
  //                 ],));
  //       print(userData);
  //     } 
  //   }
  // }

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
              onPressed: () {
                if(_loginController.text == 't' || _passwordController.text == 't'){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
                }
                // login();
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
// class ButtonWidget extends StatelessWidget {
//   const ButtonWidget({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: MaterialButton(
//       color: Colors.grey.shade400,
//       onPressed: () {
//       },
//       child: Text(
//         'Log In',
//       ),
//     ));
//   }
// }
