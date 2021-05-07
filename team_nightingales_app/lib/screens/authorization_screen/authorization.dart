import 'package:flutter/material.dart';
import 'components/curved_widget.dart';
import 'components/login_body.dart';

class Authorization extends StatelessWidget {
  const Authorization({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.white70],
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              CurvedWidget(
                child: Container(
                  
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey.shade300,
                        Colors.white.withOpacity(0.4)
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: const Text(
                          
                          'Sign In',
                          style: TextStyle(
                            fontSize: 60,
                            color: Color(0xff333030),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 50.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Center(child: Image.asset('assets/logo.png',
                          height: 270.0,
                          ))),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 350, left: 80),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    child: LoginForm()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
