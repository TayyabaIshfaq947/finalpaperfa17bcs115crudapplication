import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'profile.dart';

class splashscreen extends StatefulWidget {
  splashscreen({
    Key key,
  }) : super(key: key);
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  // ignore: must_call_super
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => profilepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Center(
              child: Text(
            'Crud Application',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/images/flowers.json'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
