import 'package:flutter/material.dart';
import 'package:medical_application/Components/tile_one.dart';
import 'package:medical_application/Data/doctors_homepage_data.dart';
import 'package:medical_application/Components/search_widget.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {

  String query = '';
  List doctorData;
  List itemsList = ['Rating', 'Experience', 'Speciality','Price','Address'];
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
  bool isSearching = false;
  String userInput;

  @override
  Widget build(BuildContext context) {

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
                              Text('All doctors', style: TextStyle(fontSize: 10.0)),
                            ),
                            SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: doctorData
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
                ),
              ],
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


