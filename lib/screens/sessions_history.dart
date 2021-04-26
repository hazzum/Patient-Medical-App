import 'package:flutter/material.dart';
import 'package:medical_application/Components/session_tile.dart';


class SessionHistory extends StatefulWidget {
  @override
  _SessionHistoryState createState() => _SessionHistoryState();
}

class _SessionHistoryState extends State<SessionHistory> {
  @override


  var lists = [
    {
      'index': '1',
      'image': 'images/3.jpg',
      'title': 'Dr. Emily Wilson',
      'rating': '5.0',
      'Price':100,
      'date': '2/7/2019',
      'time': '9:30 pm',
      'subtitle': 'Physician',
      'address' : 'Luxur'
    },
    {
      'index': '2',
      'image': 'images/4.jpg',
      'title': 'Dr. Dave Nolan',
      'rating': '5.0',
      'Price':600,
      'date': '14/8/2020',
      'time': '8:30 am',
      'subtitle': 'Physician',
      'address' : 'Alexandria'
    },
    {
      'index': '3',
      'image': 'images/5.jpg',
      'title': 'Dr. Ann Devin',
      'rating': '4.9',
      'Price':175,
      'date': '26/2/2019',
      'time': '10:00 pm',
      'subtitle': 'Neurologist',
      'address' : 'Giza'
    },
    {
      'index': '4',
      'image': 'images/6.jpg',
      'title': 'Dr. Nina Thomson',
      'rating': '4.9',
      'date': '5/4/2021',
      'time': '11:00 pm',
      'Price':250,
      'subtitle': 'Neurologist',
      'address' : 'Menufia'
    },
    {
      'index': '9',
      'image': 'images/6.jpg',
      'title': 'Dr. Nina Thomson',
      'rating': '4.3',
      'date': '3/12/2021',
      'time': '9:30 am',
      'subtitle': 'Pediatrician',
      'address' : 'Cairo',
      'Price':100,
    },
    {
      'index': '0',
      'image': 'images/7.jpg',
      'title': 'Dr. Bill Rhodney',
      'rating': '4.8',
      'date': '31/8/2020',
      'time': '2:30 pm',
      'subtitle': 'Oncologist',
      'Price': 400,
      'address' : 'Cairo'
    },
  ];

  bool isSearching = false;


  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
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
                        .map((v) => SessionTile(
                      index: v['index'],
                      title: v['title'],
                      subtitle: v['subtitle'],
                      image: v['image'],
                      price: v['Price'],
                      time: v['time'],
                      date: v['date'],
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
    );
  }
}
