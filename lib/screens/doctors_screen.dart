import 'dart:ui';
import 'package:medical_application/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:medical_application/Components/tile_one.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_application/Data/json_data.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  List snapshotData = SearchService().returnData();
  var searchedList = [];
  var filteredList = [];

  void initiateFilter(String value) {
    filteredList = snapshotData;
    if (value == 'Address') {
      setState(() {
        filteredList.sort((a, b) =>
            a['clinicInfo']['address'].compareTo(b['clinicInfo']['address']));
      });
    }
    if (value == 'Price') {
      setState(() {
        filteredList.sort((a, b) =>
            a['clinicInfo']['fees'].compareTo(b['clinicInfo']['fees']));
      });
    }
    if (value == 'Speciality') {
      setState(() {
        filteredList.sort((a, b) => a['personalInfo']['specialty']
            .compareTo(b['personalInfo']['specialty']));
      });
    }
    if (value == 'Rating' || value == 'Experience') {
      setState(() {
        filteredList.sort((a, b) => int.parse(b['clinicInfo']['fees'])
            .compareTo(int.parse(a['clinicInfo']['fees'])));
      });
    }
  }

  void initiateSearch(String value) {
    if (value.length == 0) {
      setState(() {
        searchedList = [];
      });
    }
    String lowercaseSearch = value.toLowerCase();
    if (value.length > 1) {
      searchedList = [];
      snapshotData.forEach((element) {
        if (element['displayName'].toLowerCase().contains(lowercaseSearch)) {
          setState(() {
            searchedList.add(element);
          });
        }
      });
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection('doctors');
  bool isUserSearching = false;
  bool isUserFiltering = false;
  String query = '';
  List doctorData;
  List itemsList = ['Rating', 'Experience', 'Speciality', 'Price', 'Address'];
  String selectedCategory;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF54d1f7),
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFF54d1f7),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              top: 10,
            ),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                ),
                iconSize: 35,
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          toolbarHeight: 50,
          leadingWidth: 70,
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 15, 20, 10),
              child: DropdownButton(
                underline: SizedBox(),
                elevation: 0,
                dropdownColor: Color(0xFF1DB5E4),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                iconSize: 35,
                items: itemsList.map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      textAlign: TextAlign.center, // no impact
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  initiateFilter(value);
                  setState(() {
                    selectedCategory = value;
                    isUserFiltering = true;
                    isUserSearching = false;
                  });
                },
                value: selectedCategory,
              ),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: users.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by Name',
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                    onChanged: (value) {
                      initiateSearch(value);
                      if (value == '') {
                        setState(() {
                          isUserSearching = false;
                        });
                      } else {
                        setState(() {
                          isUserSearching = true;
                          isUserFiltering = false;
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                        color: Colors.white.withOpacity(1),
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
                              child: Text('All doctors',
                                  style: TextStyle(fontSize: 10.0)),
                            ),
                            SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:
                                  ((isUserSearching && searchedList.isNotEmpty)
                                          ? (searchedList)
                                          : (isUserFiltering &&
                                                  filteredList.isNotEmpty)
                                              ? filteredList
                                              : (snapshot.data.docs))
                                      .map<Widget>((v) {
                                return TileOne(
                                  title: (v['displayName']) != null
                                      ? (v['displayName'])
                                      : 'Error',
                                  subtitle:
                                      (v['personalInfo']['specialty']) != null
                                          ? (v['personalInfo']['specialty'])
                                          : 'Error',
                                  image: (v['personalInfo']['url']) != ""
                                      ? (v['personalInfo']['url'])
                                      : "",
                                  price: (v['clinicInfo']['fees']) != null
                                      ? v['clinicInfo']['fees']
                                      : '101010',
                                  rating: int.parse(v['clinicInfo']['fees']) > 250
                                      ? '5'
                                      : '3',
                                  experience: int.parse(v['clinicInfo']['fees']) > 250
                                      ? '7'
                                      : '4',
                                  address: (v['clinicInfo']['address']) != null
                                      ? v['clinicInfo']['address']
                                      : "Error",
                                  url: (v['id']) != ''
                                      ? v['id']
                                      : "x2QUdUU42kIr1S8cimwWJ",
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        drawer: Drawer(
          child: Container(
            height: double.infinity,
            color: Color(0xFF1DB5E4),
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/imsLogo.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text(
                    'Medical form',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/eighth');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(
                    'Upcoming Appointments',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/seventh');
                  },
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/tenth');
                  },
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Session History',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                            (Route<dynamic> route) => false);                  },
                  leading: Icon(Icons.logout),
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
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
