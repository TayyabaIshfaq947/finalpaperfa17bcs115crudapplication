import 'dart:convert';
import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crudapp/AddEditPage.dart';

import 'flutter_icon_home.dart';

class mainpage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Applicaton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getData() async {
    var url = 'http://192.168.48.115/crudapp/read.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(MyFlutterApp.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => mainpage()));
              }),
          IconButton(
            icon: const Icon(Icons.contact_phone_outlined),
            tooltip: 'ContactUs',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditPage(),
            ),
          );
          debugPrint('Clicked FloatingActionButton Button');
        },
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return ListTile(
                      leading: GestureDetector(
                        child: Icon(Icons.edit),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditPage(
                                list: list,
                                index: index,
                              ),
                            ),
                          );
                          debugPrint('Edit Clicked');
                        },
                      ),
                      title: Text(list[index]['name']),
                      subtitle: Text(list[index]['phone']),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            var url =
                                'http://192.168.48.115/crudapp/delete.php';
                            http.post(Uri.parse(url), body: {
                              'id': list[index]['id'],
                            });
                          });
                          debugPrint('delete Clicked');
                        },
                      ),
                    );
                  })
              : CircularProgressIndicator();
        },
      ),
      drawer: _myDrawer(),
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
