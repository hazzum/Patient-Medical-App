import 'package:flutter/material.dart';
import 'package:medical_application/Components/session_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_application/Data/json_data.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List snapshotData = SearchService().returnData();
  var searchedList = [];
  var filteredList = [];

  void initiateFilter(String value) {
    filteredList = snapshotData;
    if (value == 'DateTime') {
      setState(() {
        filteredList.sort((a, b) =>
            a['clinicInfo']['address'].compareTo(b['clinicInfo']['address']));
      });
    }
    if (value == 'Speciality') {
      setState(() {
        filteredList.sort((a, b) =>
            a['personalInfo']['specialty'].compareTo(b['personalInfo']['specialty']));
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
        if (element['displayName']
            .toLowerCase()
            .contains(lowercaseSearch)) {
          setState(() {
            searchedList.add(element);
          });
        }
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference users = FirebaseFirestore.instance.collection('doctors');
  CollectionReference collection =
      FirebaseFirestore.instance.collection("doctors");
  bool isUserSearching = false;
  bool isUserFiltering = false;

  List itemsList = ['Speciality', 'DateTime'];
  String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              top: 5,
            ),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xFF263444),
                ),
                iconSize: 30,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          elevation: 0,
          toolbarHeight: 40,
          leadingWidth: 70,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15 ,right: 20.0),
              child: DropdownButton(
                underline: Container(),
                elevation: 0,
                dropdownColor: Colors.blueGrey,
                icon: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),child: Icon(
                    Icons.sort,
                    color: Colors.black,size: 30,

                  ),
                ),
                items: itemsList.map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Center(
                        child: Text(
                      items,
                      style: TextStyle(color: Colors.white),
                    )),
                  );
                }).toList(),
                onChanged: (value) {
                  initiateFilter(value);
                  setState(() {
                    selectedCategory = value;
                    isUserFiltering = true;
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
                              children:
                                  ((isUserSearching && searchedList.isNotEmpty)
                                          ? (searchedList)
                                          : (isUserFiltering &&
                                                  filteredList.isNotEmpty)
                                              ? filteredList
                                              : (snapshot.data.docs))
                                      .map<Widget>((v) {
                                return SessionTile(
                                  title: (v['displayName']) != null
                                      ? (v['displayName'])
                                      : 'Error',
                                  subtitle:
                                      (v['personalInfo']['specialty']) != null
                                          ? (v['personalInfo']['specialty'])
                                          : 'Error',
                                  image: (v['personalInfo']['url']) != null
                                      ? (v['personalInfo']['url'])
                                      : 'Error',
                                  date: DateTime.utc(
                                      2021,
                                      new Random().nextInt(12),
                                      new Random().nextInt(30),
                                      new Random().nextInt(24),
                                      30),
                                  time: DateTime.utc(
                                      2021,
                                      new Random().nextInt(12),
                                      new Random().nextInt(30),
                                      new Random().nextInt(24),
                                      30),
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
      ),
    );
  }
}
