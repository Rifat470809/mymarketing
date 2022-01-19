import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class developer extends StatefulWidget {
  const developer({Key? key}) : super(key: key);

  @override
  _developerState createState() => _developerState();
}

class _developerState extends State<developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              Image(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/Rifat470809/Image/master/my.png")),
              Positioned(
                  bottom: -50.0,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://raw.githubusercontent.com/Rifat470809/Images/master/OR.jpg"),
                  ))
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Center(
                child: Text(
              "Oahiduzzaman Rifat",
              style: TextStyle(fontSize: 20),
            )),
            subtitle:
                Center(child: Text("Web Designer & Flutter App Developer")),
          ),
          FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            label: Text(
              "Hire Me",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          ListTile(
            title: Text("About Me", style: TextStyle(fontSize: 18)),
            subtitle: Text(
                "Hi, My name is Oahiduzzaman Rifat. I am an app developer. I like programming or app development and try to learn new things so that I can develop myself more.",
                style: TextStyle(fontSize: 16)),
          ),
          ListTile(
            title: Text("Education :", style: TextStyle(fontSize: 18)),
            subtitle: Text(
                "Diploma in Engineering\nSherpur Institute of Science & Technology\nComputer Techonology",
                style: TextStyle(fontSize: 16)),
          ),
          ListTile(
            title: Text("Contact :", style: TextStyle(fontSize: 18)),
            subtitle: Text(
                "01518426300\noahiduzzamanrifat@gmail.com\nJagirpara, Durgapur, Netrakona",
                style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
