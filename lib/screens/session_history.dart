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
  List doctorsList = lists;
  List itemsList = ['Speciality', 'DateTime'];
  String selectedCategory;

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
              child: DropdownButton(
                underline: Container(),
                elevation: 0,
                dropdownColor: Colors.blueGrey,
                icon: Icon(
                  Icons.sort,
                  color: Colors.black,
                ),
                items: itemsList.map((items){
                  return DropdownMenuItem(
                    value: items,
                    child: Center(child: Text(items, style: TextStyle(color: Colors.white),)),);
                }).toList(),
                onChanged: (value){
                  setState(() {
                    selectedCategory = value;
                    sortFilteredDoctors(value);
                  });
                },
                value: selectedCategory,


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
                            time: v['DateTime'],
                            date: v['DateTime'],
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
    final searchList = doctorsList.where((card) {
      final titleLower = card['title'].toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.doctorData = searchList;
    });
  }

  void  sortFilteredDoctors(String value){
    if (value == 'DateTime')
      doctorData.sort((a, b) => b['DateTime'].compareTo(a['DateTime']));
    else if (value == 'Speciality')
      doctorData.sort((a, b) => b['subtitle'].compareTo(a['subtitle']));


    setState(() {
      this.doctorData = doctorData;
    });
  }
}



