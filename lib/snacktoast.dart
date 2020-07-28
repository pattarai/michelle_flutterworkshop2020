import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SnackBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SnackBarDemo();
  }
}

class _SnackBarDemo extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfffff1dd),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Center(
            child: RaisedButton(
              color: Color(0xffd8aeae),
              child: Text("Press here for snack bar!"),
              onPressed: () {
                var snackbar = SnackBar(content: Text("This is a snackbar"));
                Scaffold.of(context).showSnackBar(snackbar);
              },
            ),
          ),
          Center(
            child: RaisedButton(
              color: Color(0xffd8aeae),
              child: Text("Toast message"),
              onPressed: () {
                Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM, backgroundColor: Color(0xffd8aeae));
              },
            ),
          )
        ],
      ),
    );
  }

}