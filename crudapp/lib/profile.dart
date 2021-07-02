import 'package:crudapp/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class profilepage extends StatefulWidget {
  profilepage({
    Key key,
  }) : super(key: key);
  @override
  _profilepageState createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => mainpage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/tayyaba.png'),
                backgroundColor: Colors.white,
                radius: 50.0,
              ),
            ),
            Text(
              'Tayyaba Ishfaq',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'FA17_BCS_115',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(
              width: 280.0,
              height: 20.0,
              child: Divider(
                color: Colors.pink,
                thickness: 4.0,
              ),
            ),
            Container(
              height: 140,
              width: 140,
              child: Lottie.asset('assets/images/loader.json'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Loading....',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            )
          ]),
        ),
      ),
    );
  }
}
