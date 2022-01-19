import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String user_name = '';
  String user_mobile = '';
  String user_Address = '';
  String pass = '';

  @override
  void initState() {
    // TODO: implement initState
    getsharpref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              Text("Username: $user_name",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              Text("Phone: $user_mobile",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              Text("Address: $user_Address",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              Text("Password: $pass",
                  style: TextStyle(fontSize: 15, color: Colors.black))
            ],
          ),
        ));
  }

  getsharpref() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      user_name = pref.getString('user_name') ?? '';
      user_mobile = pref.getString('user_mobile') ?? '';
      user_Address = pref.getString('user_address') ?? '';
      pass = pref.getString('pass') ?? '';
    });
  }
}
