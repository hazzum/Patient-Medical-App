import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
/* import 'package:syncfusion_flutter_calendar/calendar.dart'; */

class UpcomingAppointments extends StatefulWidget {
  @override
  _UpcomingAppointmentsState createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1DB5E4),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Calender',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 50),
                  child: SfCalendar(
                    cellBorderColor: Color(0xFF1DB5E4),
                    todayHighlightColor: Color(0xFF1DB5E4),
                    view: CalendarView.week,
                    backgroundColor: Colors.black38,
                    dataSource: MeetingDataSource(getDataSource()),
                    monthViewSettings: MonthViewSettings(
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.appointment),
                  )),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.alarm,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Upcoming Appointments',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                width: double.infinity,
                color: Colors.black38,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text('1- Dr. Professional Session (Tuesday, 25, july 2021) from 11am to 1am',
                    style: TextStyle(color: Colors.white),),

                    SizedBox(
                      height: 15,
                    ),
                    Text('2- Dr. Ahmed Abd-Elaziz (Tuesday, 30, july 2021) from 9am to 11am.',
                      style: TextStyle(color: Colors.white),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Appointment> getDataSource() {
  final List<Appointment> meetings = <Appointment>[];
  final DateTime today2 = DateTime.utc(2021, 7, 25);
  final DateTime today = DateTime.utc(2021, 7, 30);
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  final DateTime startTime2 =
  DateTime(today2.year, today2.month, today2.day, 11, 0, 0);
  final DateTime endTime2 = startTime2.add(const Duration(hours: 2));


  meetings.add(
      Appointment(
      subject: 'S1',
      startTime: startTime,
      endTime: endTime,
      color: Colors.black54));

  meetings.add(
      Appointment(
      subject: 'S2',
      startTime: startTime2,
      endTime: endTime2,
      color: Colors.black54));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
