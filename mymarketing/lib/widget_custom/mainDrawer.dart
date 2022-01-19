import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymarketing/Auth/developer.dart';
import 'package:mymarketing/Auth/login.dart';
import 'package:mymarketing/Auth/signup.dart';
import 'package:mymarketing/ecommerce/home.dart';

import '../Auth/profile.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.account_box, size: 50, color: Colors.teal),
              Text('User name'),
              Text('Username@gmail.com'),
              Divider(thickness: 1, color: Colors.teal),
            ],
          )),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
              Fluttertoast.showToast(
                  msg: 'Home', toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('SignUp'),
            leading: Icon(Icons.login),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => singup()));
              Fluttertoast.showToast(
                  msg: 'SignUp', toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('profile'),
            leading: Icon(Icons.account_box),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => profile()));
              Fluttertoast.showToast(
                  msg: 'profile', toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('About Developer'),
            leading: Icon(Icons.ac_unit),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => developer()));
              Fluttertoast.showToast(
                  msg: 'About Developer', toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('Log out'),
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => login()));
              Fluttertoast.showToast(
                  msg: 'Log out', toastLength: Toast.LENGTH_LONG);
            },
          ),
          /*ListTile(
            title: Text('Product List'),
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ListProduct()));
              Fluttertoast.showToast(msg: 'List Product',toastLength: Toast.LENGTH_LONG);
            },
          ),ListTile(
            title: Text('Counter'),
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> counter()));
              Fluttertoast.showToast(msg: 'Counter',toastLength: Toast.LENGTH_LONG);
            },
          ),ListTile(
            title: Text('ChoiceRow'),
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChoiceRow()));
              Fluttertoast.showToast(msg: 'ChoiceRow',toastLength: Toast.LENGTH_LONG);
            },
          ),ListTile(
            title: Text('Search'),
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));
              Fluttertoast.showToast(msg: 'Search',toastLength: Toast.LENGTH_LONG);
            },
          ) */
        ],
      ),
    );
  }
}
