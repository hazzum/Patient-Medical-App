import 'package:flutter/material.dart';
import '../components/tile_one.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorPage extends StatefulWidget {
  final String id;
  const DoctorPage({Key key, this.id}) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  var data = {
    'index': '1',
    'image': 'images/3.jpg',
    'title': 'Dr. Emily Wilson',
    'rating': '5.0',
    'experience': '2',
    'subtitle': 'Physician',
    'address': 'Cairo',
    'price': '150',
  };
  CollectionReference users = FirebaseFirestore.instance.collection('doctors');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: users.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,0,0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                      size: 25,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,0,0),
                  child: Text(
                    'Doctor\'s details',
                    style: TextStyle(
                      color:  Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              body: Container(
                  decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Column(
                          children: snapshot.data.docs.map<Widget>((v) {
                            if (widget.id == v['id']) {
                              return TileOne(
                                color: false,
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
                                price: (v['clinicInfo']['fees']) != null
                                    ? v['clinicInfo']['fees']
                                    : '101010',
                                rating: '5',
                                experience: '3',
                                address: (v['clinicInfo']['address']) != null
                                    ? v['clinicInfo']['address']
                                    : "Error",
                              );
                            }
                            else{
                            return SizedBox(height: 000000000.1,);}
                          }).toList(),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Education",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TileSecond(
                            title: 'Loyola University Chicago SSOM',
                            subtitle: "Doctor of Medicine",
                            icon: Icons.call_split),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Text('Information',
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25.0),
                              child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF54d1f7).withOpacity(0.1),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Text(
                                      'As a primary care physician, Emily Wilson, MD, provides comprehensive services to patients of all ages, Dr. Wilson offers inclusive family medicine with a particular focus on diabetes care for adults and geriatric medicine',
                                      style: TextStyle(fontSize: 16.0))),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25.0),
                          child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                  color:
                                  Color(0xFF54d1f7).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text('Available dates',
                                  style: TextStyle(fontSize: 16.0))),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          child: Text(
                            "BOOK NOW",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color:  Colors.white,
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF54d1f7),
                            onPrimary: Colors.white,
                            onSurface: Colors.grey,
                            elevation: 0,
                          ),
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                  )));
        });
  }
}

class TileSecond extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const TileSecond({Key key, this.title, this.subtitle, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color:Color(0xFF54d1f7).withOpacity(0.1)),
        child: Row(
          children: <Widget>[
            Container(
                height: 50.0,
                width: 50.0,
                margin: EdgeInsets.only(right: 15.0),
                decoration: BoxDecoration(
                    color: Color(0xFF54d1f7),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Icon(icon, color: Colors.white)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      wordSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0),
                ),
                SizedBox(height: 2),
                Text(subtitle,
                    style:
                        TextStyle(fontSize: 12.0, color: Colors.grey.shade600)),
              ],
            )
          ],
        ));
  }
}
