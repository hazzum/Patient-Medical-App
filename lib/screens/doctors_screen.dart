import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:medical_application/Components/tile_one.dart';
import 'package:medical_application/Data/doctors_homepage_data.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }
  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  List doctorsList = lists;
  bool isSearching = false;
  String userInput;
  @override
  Widget build(BuildContext context) {
    var color2 = Color(0xDDf7f5fb);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          leading:
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                    Icons.menu_rounded,
                color: Color(0xFF263444),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          toolbarHeight: 50,
          leadingWidth: 70,

          actions: [

            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
            ),

          ],
        ),
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0)),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 25.0, bottom: 5.0),
                        child:
                        Text('All doctors', style: TextStyle(fontSize: 10.0)),
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: lists
                            .map((v) => TileOne(
                          index: v['index'],
                          title: v['title'],
                          subtitle: v['subtitle'],
                          image: v['image'],
                          price: v['Price'],
                          rating: v['rating'],
                          experience: v['experience'],
                          address: v['address'],
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),


        drawer: Drawer(
          child: Container(
            height: double.infinity,
            color:  Colors.black26,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Doctor Who?'),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/logo.png"),
                          fit: BoxFit.fitHeight,
                      ),
                  ),
                ),
                
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Medical form'),
                  onTap: () {
                    Navigator.pushNamed(context, '/eighth');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Upcoming Appointments'),
                  onTap: () {
                    Navigator.pushNamed(context, '/seventh');
                    }, ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/tenth');
                    },
                  leading: Icon(Icons.settings),
                  title: Text('Session History'),
                ),


              ],
            ),
          ),
        ),
        drawerEnableOpenDragGesture: true,

      ),
    );
  }
}


