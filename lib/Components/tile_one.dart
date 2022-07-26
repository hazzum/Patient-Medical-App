import 'package:flutter/material.dart';
import 'package:medical_application/screens/chosen_doctor_page.dart';

class TileOne extends StatelessWidget {
  final String url;

  final String image;

  final String title;

  final String subtitle;

  final String rating;

  final String experience;

  final bool color;

  final String address;

  final String price;

  TileOne(
      {Key key,
      this.url,
      this.image,
      this.title,
      this.subtitle,
      this.rating,
      this.address,
      this.price,
      this.color = true,
      this.experience})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorPage(
              id: url,
            ),
          ),
        );
      },
      child: Hero(
        tag: 'doctor'+this.title,
        child: Container(
          margin: EdgeInsets.only(left: 15.0, bottom: 5.0, right: 15.0),
          padding:
              EdgeInsets.only(left: 5.0, right: 15.0, top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color:
                  color ? Color(0xFF1DB5E4).withAlpha(40) :  Color(0xFF54d1f7).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5.0)),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        color: Colors.transparent,
                        child: Text(title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16,
                            ))),
                    Material(
                      color: Colors.transparent,
                      child: Text(subtitle,
                          style: TextStyle(color: Colors.grey.shade600)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.place,
                            size: 13,
                            color: Colors.black54,
                          ),
                          Text(address,
                              style: TextStyle(
                                color: Colors.blueGrey.shade500,
                                fontSize: 13,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Text('$price',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              )),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Egyptian Pounds',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.orange, size: 10.0),
                      SizedBox(width: 2),
                      Material(color: Colors.transparent, child: Text(rating))
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text('Exp: ' + experience + ' years',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 10.0)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
