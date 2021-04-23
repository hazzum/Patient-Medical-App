import 'package:flutter/material.dart';
import '../components/tile_one.dart';

class DoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = {
      'index': '1',
      'image': 'images/3.jpg',
      'title': 'Dr. Emily Wilson',
      'rating': '5.0',
      'experience': '2',
      'subtitle': 'Physician',
      'address' : 'Cairo',
      'price': 150,
    };

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),

            title: Text('Doctor\'s details',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
            ),),
            body: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TileOne(
                    index: data['index'],
                    title: data['title'],
                    address: data['address'],
                    price: data['price'],
                    subtitle: data['subtitle'],
                    image: data['image'],
                    rating: data['rating'],
                    experience: data['experience'],
                    color: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Education",
                          style: TextStyle(color: Colors.grey,),
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
                            style: TextStyle(color: Colors.grey)),
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
                                color: Colors.blueGrey.shade100.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10.0)),
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
                          color: Colors.blueGrey.shade100.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                          'Available dates',
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
                    ),),
                  onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                      elevation: 0,
                    ),
                ),
                  SizedBox(height: 20)
                ],
              ),
            )));
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
            color: Colors.blueGrey.withOpacity(0.4)),
        child: Row(
          children: <Widget>[
            Container(
                height: 50.0,
                width: 50.0,
                margin: EdgeInsets.only(right: 15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Icon(icon, color: Colors.blueGrey)),
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