import 'package:flutter/material.dart';
import 'package:medical_application/Data/session_history_data.dart';
import 'package:medical_application/Components/search_widget.dart';
import 'package:medical_application/Components/session_tile.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isSearching = false;
  String userInput;
  String query = '';
  List doctorData;

  @override
  void initState() {
    super.initState();
    doctorData = lists;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          toolbarHeight: 40,
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
        body: Column(
          children: [
            buildSearch(),
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
                          child:
                          Text('Session History', style: TextStyle(fontSize: 15.0)),
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: doctorData
                              .map((v) => SessionTile(
                            index: v['index'],
                            title: v['title'],
                            subtitle: v['subtitle'],
                            image: v['image'],
                            price: v['Price'],
                            time: v['Time'],
                            date: v['Date'],
                            address: v['address'],
                          ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Doctor or Speciality name',
    onChanged: searchForDoctor,
  );
  void searchForDoctor(String query) {
    final searchList = doctorData.where((card) {
      final titleLower = card['title'].toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.doctorData = searchList;
    });
  }
}



