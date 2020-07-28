import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/snacktoast.dart';
import 'package:flutter_assignment_app/stacks.dart';
import 'package:flutter_assignment_app/webview_demo.dart';
import 'main.dart';
import 'package:flutter_assignment_app/main.dart';




class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {
  HomeScreen() {}

  int x = 10;

  var drawerItems = [
    new DrawerItem("Login", Icons.vpn_key),
    new DrawerItem("Stack", Icons.layers),
    new DrawerItem("Messages", Icons.question_answer),
    new DrawerItem("WebviewDemo", Icons.accessibility)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  BuildContext _ctx;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return MyApp();
        break;
      case 1:
        return StackDemo();
        break;
      case 2:
        return SnackBarDemo();
        break;
      default:
        return WebViewDemo();
        break;
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var drawerOptions = <Widget>[];

    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xff293844),
        title: Text("Aestheticslay"),
      ),

      drawer: new Drawer(
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Michelle"),
                accountEmail: new Text("vsnehamichelle@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: const Color(0xFF778899),
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.5OV0BTPQ60EJolzRRShP7wHaLe?w=200&h=311&c=7&o=5&dpr=1.25&pid=1.7"), // for Network image
                ),
                decoration: new BoxDecoration(
                  color: Color(0xFF222437),
                ),
              ),
              new Column(children: drawerOptions)
            ],
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}