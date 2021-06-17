import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_application/Components/tile_one.dart';
import 'package:medical_application/Data/doctors_homepage_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_application/Data/json_data.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  List snapshotData = SearchService().returnData();
  var searchedList = [];
  var filteredList= [];

  void initiateFilter(String value){
    filteredList = snapshotData;
      String lowercaseSearch = value.toLowerCase();
      if (value == 'Address'){
        setState(() {
          filteredList.sort((a, b) => a['clinicInfo']['address'].compareTo(b['clinicInfo']['address']));
        });
        print(filteredList);
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
        if (element['personalInfo']['displayName']
            .toLowerCase()
            .contains(lowercaseSearch)) {
          setState(() {
            searchedList.add(element);
          });
        }
      });
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection('doctors');
  CollectionReference collection =
      FirebaseFirestore.instance.collection("doctors");
  bool isUserSearching = false;
  bool isUserFiltering = false;
  String query = '';
  List doctorData;
  List itemsList = ['Rating', 'Experience', 'Speciality', 'Price', 'Address'];
  String selectedCategory;

  @override
  void initState() {
    super.initState();
    doctorData = lists;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    Navigator.of(context).pop();
  }

  List doctorsList = lists;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              top: 5,
            ),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  color: Color(0xFF263444),
                ),
                iconSize: 35,
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          toolbarHeight: 40,
          leadingWidth: 70,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 18.0),
              child: DropdownButton(
                underline: Container(),
                elevation: 0,
                dropdownColor: Colors.blueGrey,
                icon: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: Icon(
                    Icons.sort,
                    color: Color(0xFF263444),
                  ),
                ),
                iconSize: 35,
                items: itemsList.map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Center(
                      child: Text(
                        items,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged:(value) {
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
                  padding: const EdgeInsets.fromLTRB(90, 8, 25, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(4),
                      hintText: 'Search doctors by name',
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
                              child: Text('All doctors',
                                  style: TextStyle(fontSize: 10.0)),
                            ),
                            SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: ((isUserSearching && searchedList.isNotEmpty)
                                      ? (searchedList)
                                      : (isUserFiltering && filteredList.isNotEmpty)?
                              filteredList : (snapshot.data.docs))
                                  .map<Widget>((v) {
                                return TileOne(
                                  title:
                                      (v['personalInfo']['displayName']) != null
                                          ? (v['personalInfo']['displayName'])
                                          : 'Error',
                                  subtitle:
                                      (v['personalInfo']['specialty']) != null
                                          ? (v['personalInfo']['specialty'])
                                          : 'Error',
                                  image: (v['personalInfo']['url']) != null
                                      ? (v['personalInfo']['url'])
                                      : 'Error',
                                  price: (v['clinicInfo']['fees']) != null
                                      ? v['clinicInfo']['fees']
                                      : '101010',
                                  rating: '5',
                                  experience: '3',
                                  address: (v['clinicInfo']['address']) != null
                                      ? v['clinicInfo']['address']
                                      : "Error",
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
            color: Colors.black26,
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
              ],
            ),
          ),
        ),
        drawerEnableOpenDragGesture: true,
      ),
    );
  }

  sortFilteredDoctors(String value) {
    if (value == 'Rating')
      doctorData.sort((a, b) => b['rating'].compareTo(a['rating']));
    else if (value == 'Experience')
      doctorData.sort((a, b) => b['experience'].compareTo(a['experience']));
    else if (value == 'Speciality')
      doctorData.sort((a, b) => b['subtitle'].compareTo(a['subtitle']));
    else if (value == 'Address')
      doctorData.sort((a, b) => a['address'].compareTo(b['address']));
    else if (value == 'Price')
      doctorData.sort((a, b) => a['Price'].compareTo(b['Price']));

    setState(() {
      this.doctorData = doctorData;
    });
  }
}
