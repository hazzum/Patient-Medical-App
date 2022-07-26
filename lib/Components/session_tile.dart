import 'package:flutter/material.dart';

class SessionTile extends StatelessWidget {
  final String image;

  final String title;

  final String subtitle;

  final DateTime date;

  final DateTime time;

  final bool color;

  final String address;

  SessionTile(
      {Key key,
      this.image,
      this.title,
      this.subtitle,
      this.address,
      this.time,
      this.color = true,
      this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/ninth');
      },
      child: Hero(
        tag: 'session' + this.title,
        child: Container(
          margin: EdgeInsets.only(left: 15.0, bottom: 5.0, right: 15.0),
          padding:
              EdgeInsets.only(left: 5.0, right: 15.0, top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color:
                  color ? Color(0xFF1DB5E4).withAlpha(40) : Colors.transparent,
              borderRadius: BorderRadius.circular(5.0)),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  (image == "")
                      ? 'https://as2.ftcdn.net/v2/jpg/04/26/99/95/1000_F_426999565_AJdlhzyu9f3kL5T6cXlZJfkg4AoCDc6E.jpg'
                      : image,
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
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
                              color: Colors.black87,
                              fontSize: 15,
                            ))),
                    Material(
                      color: Colors.transparent,
                      child: Text(subtitle,
                          style: TextStyle(color: Colors.grey.shade600)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                          (date.day).toString() +
                              '/' +
                              (date.month).toString() +
                              '/' +
                              (date.year).toString(),
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 11.0)),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                          (time.hour).toString() +
                              ':' +
                              (date.minute).toString(),
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 11.0)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
