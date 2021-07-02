import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:contactus/contactus.dart';
import 'flutter_icon_home.dart';

class contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            "Contact Us",
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(MyFlutterApp.home),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => contactus()));
                }),
            IconButton(
              icon: const Icon(Icons.contact_phone_outlined),
              tooltip: 'ContactUs',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => contactus()));
              },
            ),
          ],
        ),
        body: ContactUs(
          logo: AssetImage('assets/images/tayyaba.png'),
          email: 'taibatahira84@gmail.com',
          companyName: 'Flutter Inventions',
          phoneNumber: '+923111619390',
          website: 'https://www.flutter.dev/',
          githubUserName: 'TayyabaIshfaq947',
          tagLine: 'Flutter Developer',
        ),
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Flutter Developer',
          textColor: Colors.white,
          backgroundColor: Colors.pinkAccent,
          email: 'taibatahira84@gmail.com',
        ),
        drawer: _myDrawer(),
      ),
    );
  }
}

class _myDrawer extends StatelessWidget {
  final Function ontap;

  _myDrawer({this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(left: 30),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/tayyaba.png"),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Tayyaba Ishfaq',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'taibatahira84@gmail.com',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
