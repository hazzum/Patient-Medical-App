import 'package:flutter/material.dart';

class SessionTile extends StatelessWidget {
  final String image;

  final String title;

  final String subtitle;

  final DateTime date;

  final DateTime time;

  final String index;

  final bool color;

  final String address;

  final int price;

  SessionTile(
      {Key key,
        this.image,
        this.index,
        this.title,
        this.subtitle,
        this.address,
        this.time,
        this.price,
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
        tag: 'doctor' + index,
        child: Container(
          margin: EdgeInsets.only(left: 15.0, bottom: 5.0, right: 15.0),
          padding:
          EdgeInsets.only(left: 5.0, right: 15.0, top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color: color
                  ? Colors.blueGrey.shade400.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(5.0)),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  width: 100,
                  fit: BoxFit.cover,
                  height: 100,
                  image: AssetImage(image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        color: Colors.transparent,
                        child: Text(title,
                            style: TextStyle(color: Colors.black54,
                              fontSize: 16,))),
                    Material(
                      color: Colors.transparent,
                      child: Text(subtitle,
                          style: TextStyle(color: Colors.grey.shade600)),
                    ),
                    SizedBox(height: 5,),

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
                      child: Text((date.day).toString() + '/' + (date.month).toString() + '/' + (date.year).toString() ,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 12.0)),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text((time.hour).toString() + ':' + (date.minute).toString(),
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 12.0)),
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