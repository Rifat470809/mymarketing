import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymarketing/Auth/login.dart';
import 'package:mymarketing/Auth/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class singup extends StatefulWidget {
  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  int radiaovalue = 0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController usermobileController = TextEditingController();
  TextEditingController useraddressController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    icon: const Icon(Icons.account_box),
                    hintText: 'Enter Name',
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: usermobileController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter You Phone',
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: useraddressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                    icon: const Icon(Icons.account_box),
                    hintText: 'Enter You Address',
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  controller: passController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    icon: const Icon(Icons.vpn_key),
                    hintText: 'Enter You Password',
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: radiaovalue,
                        onChanged: (value) {
                          setState(() {
                            radiaovalue = value as int;
                          });
                        }),
                    Text("Male")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: 2,
                        groupValue: radiaovalue,
                        onChanged: (value) {
                          setState(() {
                            radiaovalue = value as int;
                          });
                        }),
                    Text("FeMale")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF0CE87A)),
              child: TextButton(
                onPressed: () {
                  setShaPref();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: Text('Submit',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  gender() {
    if (radiaovalue == 1) {
      Fluttertoast.showToast(msg: "Male", toastLength: Toast.LENGTH_LONG);
    } else if (radiaovalue == 2) {
      Fluttertoast.showToast(msg: "Male", toastLength: Toast.LENGTH_LONG);
    }
  }

  setShaPref() async {
    final pref = await SharedPreferences.getInstance();

    pref.setString('user_name', usernameController.text);
    pref.setString('user_mobile', usermobileController.text);
    pref.setString('user_address', useraddressController.text);
    pref.setString('pass', passController.text);
  }
}
