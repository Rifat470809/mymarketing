import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mymarketing/Auth/login.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  bool value = false;

  @override
  void initState() {
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => login()));
      //Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => signIn(), (_) => false));
    });
  }

  @override
  Widget build(BuildContext context) {
    final sc_height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            value = !value;
          });
        },
      ), */
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: sc_height / 2,
              child: Image.network(
                  'https://raw.githubusercontent.com/Rifat470809/Image/master/logo.jpg'),
            ),

            /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: sc_height / 2,
                child: FlareActor(
                  'animation/Teddy.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  animation: value == false ? 'fail' : 'success',
                ),
              ),
            ),
             */
            SizedBox(
              height: sc_height / 12,
            ),
            Container(
                height: sc_height / 5,
                child: Center(
                  child: Text(
                    "My Marketing",
                    style: GoogleFonts.arbutus(
                        textStyle: TextStyle(
                            fontSize: width / 12, color: Colors.blue)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
