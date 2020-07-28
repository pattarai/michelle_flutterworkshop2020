import 'package:flutter/material.dart';
import 'drawers.dart';


void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class StackDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Stack();
  }
}

class _Stack extends State<StackDemo> {
  TextEditingController _stackController = new TextEditingController();

  List<int> stack = new List<int>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfffff1dd),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Enter a number to push into the stack:",
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: _stackController,
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    child: Text("Push"),
                    color: Color(0xffd8aeae),
                    onPressed: () {
                      stack.add(int.parse(_stackController.text));
                      print(stack.toString());
                      setState(() {});
                    }),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                RaisedButton(
                    child: Text("Pop"),
                    color: Color(0xffd8aeae),
                    onPressed: () {
                      try {
                        stack.removeLast();
                      } on RangeError catch (e) {
                        print("Underflow detected!");
                      }

                      print(stack.toString());
                      setState(() {});
                    }),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              "Elements in the stack are:",
              textAlign: TextAlign.center,
            ),
            Column(
              children: returnStackElements(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> returnStackElements() {
    List<Widget> elementsToReturn = [];
    stack.reversed.forEach((element) {
      elementsToReturn.add(Text(element.toString()));
    });
    return elementsToReturn;
  }
}