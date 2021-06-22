import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SessionContent extends StatefulWidget {
  const SessionContent({Key key}) : super(key: key);

  @override
  _SessionContentState createState() => _SessionContentState();
}

class _SessionContentState extends State<SessionContent> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text(
              'Session content',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black54,
                size: 25,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            color: Colors.white,
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Symptoms",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Color(0xFF54d1f7).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                                "feeling feverish\ncough\nsore throat\nrunny or stuffy nose\nmuscle or body aches\nheadaches\nfatigue (tiredness)\nVomiting and diarrhea",
                                style: TextStyle(fontSize: 16.0))),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Diagnosis",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Color(0xFF54d1f7).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                                "Tha patient suffered from sore throat due to a bacterial infections in the lung, he didn't experience any issues in his eating or sleeping behaviors, this indicates that it's not Covid-19 case, it's regular Flu",
                                style: TextStyle(fontSize: 16.0))),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Comments",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Color(0xFF54d1f7).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                                "SARS-CoV-2 lab\nThese Laboratory tests are needed:\ncomplete blood count, C-reactive protein (CRP), D-dimer, clotting tests, lactic dehydrogenase (LDH), ferritin, and procalcitonin",
                                style: TextStyle(fontSize: 16.0))),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Prescription",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: Color(0xFF54d1f7).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                                  Text(
                                    "Dr. Emily Wilson - Physician",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    "Consultant Of General and Vascular surgery\nMbb. CH. MS. MD.\n",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),

                              Divider(color: Colors.black),
                              Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      color: Color(0xFF54d1f7).withOpacity(0.1),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'R/',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                          "Relenza (zanamivir), Rapivab (peramivir) , or Xofluza (baloxavir marboxil)",
                                          style: TextStyle(fontSize: 16.0)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          "Pen-Vee K (penicillin), Amoxil (amoxicillin), or Keflex (cephalosporin)",
                                          style: TextStyle(fontSize: 16.0)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("Flonase (fluticasone)",
                                          style: TextStyle(fontSize: 16.0)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("Tussionex PennKinetic or Nalex AC",
                                          style: TextStyle(fontSize: 16.0)),
                                    ],
                                  )),
                              Divider(color: Colors.black),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Clinic number: 01147374254",
                                      style: TextStyle(fontSize: 16.0)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "Clinic location: 45 Mahmoud El-ez street, Cairo",
                                      style: TextStyle(fontSize: 16.0)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "Clinic Working hours: Sunday to Thursday, from 7am to 2pm",
                                      style: TextStyle(fontSize: 16.0)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Tussionex PennKinetic or Nalex AC",
                                      style: TextStyle(fontSize: 16.0)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
