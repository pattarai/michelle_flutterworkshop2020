
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';



class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }

}

class _Login extends State<Login> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      backgroundColor: Color(0xffdae2df),


      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: Center(child: Text("Welcome to Calc!", style: TextStyle(fontFamily: "JosefinSans", fontSize: 30),)),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
