import 'package:flutter/material.dart';
import 'package:medical_application/Components/tile_one.dart';

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

  bool isSearching = false;
  String userInput;
  @override
  Widget build(BuildContext context) {
    var color2 = Color(0xDDf7f5fb);

    var lists = [
      {
        'index': '1',
        'image': 'images/3.jpg',
        'title': 'Dr. Emily Wilson',
        'rating': '5.0',
        'Price':100,
        'experience': '2',
        'subtitle': 'Physician',
        'address' : 'Luxur'
      },
      {
        'index': '2',
        'image': 'images/4.jpg',
        'title': 'Dr. Dave Nolan',
        'rating': '5.0',
        'Price':600,
        'experience': '3',
        'subtitle': 'Physician',
        'address' : 'Alexandria'
      },
      {
        'index': '3',
        'image': 'images/5.jpg',
        'title': 'Dr. Ann Devin',
        'rating': '4.9',
        'Price':175,
        'experience': '3',
        'subtitle': 'Neurologist',
        'address' : 'Giza'
      },
      {
        'index': '4',
        'image': 'images/6.jpg',
        'title': 'Dr. Nina Thomson',
        'rating': '4.9',
        'experience': '3',
        'Price':250,
        'subtitle': 'Neurologist',
        'address' : 'Menufia'
      },
      {
        'index': '5',
        'image': 'images/7.jpg',
        'title': 'Dr. Bill Rhodney',
        'rating': '4.8',
        'experience': '3',
        'Price':400,
        'subtitle': 'Oncologist',
        'address' : 'Cairo'
      },
      {
        'index': '6',
        'image': 'images/8.jpeg',
        'title': 'Dr. Emily Wilson',
        'rating': '4.5',
        'Price':65,
        'experience': '2',
        'subtitle': 'Physician',
        'address' : 'Aswan'
      },
      {
        'index': '7',
        'image': 'images/9.jpg',
        'title': 'Dr. Dave Nolan',
        'rating': '4.3',
        'Price':80,
        'experience': '3',
        'subtitle': 'Physician',
        'address' : 'Red Sea'
      },
      {
        'index': '8',
        'image': 'images/10.jpg',
        'title': 'Dr. Ann Devin',
        'rating': '4.3',
        'experience': '3',
        'Price':150,
        'subtitle': 'Pediatrician',
        'address' : 'Qaliuobia'
      },
      {
        'index': '9',
        'image': 'images/6.jpg',
        'title': 'Dr. Nina Thomson',
        'rating': '4.3',
        'experience': '3',
        'subtitle': 'Pediatrician',
        'address' : 'Cairo',
        'Price':100,
      },
      {
        'index': '0',
        'image': 'images/7.jpg',
        'title': 'Dr. Bill Rhodney',
        'rating': '4.8',
        'experience': '3',
        'subtitle': 'Oncologist',
        'Price': 400,
        'address' : 'Cairo'
      },
    ];

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
          toolbarHeight: 80,
          leadingWidth: 70,
          title:  Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a doctor',
                focusColor: Colors.white10,
              ),
            ),
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: GestureDetector(
                onTap: null,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFF263444),
                  ),
                  onPressed: (){
                    setState(() {
                      this.isSearching = !isSearching;
                    });

                  },),
              ),
            ),
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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/logo.png"),
                          fit: BoxFit.fitHeight,
                      ),
                  ),
                ),
                
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Medical Information'),
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
                    Navigator.pushNamed(context, '/ninth');
                    },
                  leading: Icon(Icons.settings),
                  title: Text('Personal Session History'),
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


