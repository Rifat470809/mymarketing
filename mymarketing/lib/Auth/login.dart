import 'package:flutter/material.dart';
import 'package:mymarketing/Auth/Forgotpass.dart';
import 'package:mymarketing/Auth/profile.dart';
import 'package:mymarketing/ecommerce/home.dart';
import 'package:mymarketing/Auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  String superuser = 'admin';
  String superpass = 'password';

  String user_name = '';
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image.network(
                    "https://raw.githubusercontent.com/Rifat470809/Image/master/logo.jpg"),
              ),
              SizedBox(
                height: 30,
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
                      hintText: 'Enter You Name',
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      icon: const Icon(Icons.vpn_key),
                      hintText: 'Enter You Password',
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    //setShaPref();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPass()));
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
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
                    if (usernameController.text.isEmpty &&
                        passController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'Please give your ID and pass',
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Colors.deepOrange);
                    } else if ((user_name == usernameController.text &&
                            pass == passController.text) ||
                        (superuser == usernameController.text &&
                            superpass == passController.text)) {
                      Fluttertoast.showToast(
                          msg: 'Login Successful',
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Colors.deepOrange);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Please try with valid password',
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Colors.deepOrange);
                    }
                  },
                  child: Text('Sign In',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => singup()));
                  },
                  child: Text('Sign Up',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ]),
          ),
        ));
  }

  getsharpref() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      user_name = pref.getString('user_name') ?? '';
      pass = pref.getString('pass') ?? '';
    });
  }
}
