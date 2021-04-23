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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black26,
              size: 20,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),

          title: Text('Calender',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),),

        body: Column(
          children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SfCalendar(
                    view:CalendarView.week,
                    backgroundColor: Colors.blueGrey.shade500,
                    dataSource: MeetingDataSource(getDataSource()),
                    monthViewSettings: MonthViewSettings(
                        appointmentDisplayMode: MonthAppointmentDisplayMode
                            .appointment),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
  List<Appointment> getDataSource() {
    final List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Appointment(
        subject: 'Conference', startTime: startTime ,endTime: endTime , color: Colors.black));
    return meetings;

}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}