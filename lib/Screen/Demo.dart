import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Uri _url = Uri.parse('https://developmentalphawizz.com/invitation_design/welcome/wedding_card');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  DateTime? _selectedDate;
  String? _selectedWeekday;
  Map<String, int> weekdayCount = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekday Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _selectedDate == null
                  ? 'Select a date'
                  : 'Selected Date: ${DateFormat('MMMM d, y').format(_selectedDate!)}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _launchUrl();
                // DateTime? picked = await showDatePicker(
                //   context: context,
                //   initialDate: DateTime.now(),
                //   firstDate: DateTime(2000),
                //   lastDate: DateTime(2101),
                // );
                //
                // if (picked != null && picked != _selectedDate) {
                //   setState(() {
                //     _selectedDate = picked;
                //     _selectedWeekday = DateFormat('EEEE').format(_selectedDate!);
                //     _updateWeekdayCount();
                //   });
                // }
              },
              child: const Text('Select Date'),
            ),
            const SizedBox(height: 20),
            _selectedWeekday != null
                ? Text('Selected Weekday: $_selectedWeekday')
                : Container(),
            const SizedBox(height: 20),
            _selectedWeekday != null
                ? Text('Count in Selected Month: ${weekdayCount[_selectedWeekday] ?? 0}')
                : Container(),
          ],
        ),
      ),
    );
  }

  void _updateWeekdayCount() {
    weekdayCount.clear();

    int daysInMonth = DateTime(_selectedDate!.year, _selectedDate!.month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      DateTime currentDate = DateTime(_selectedDate!.year, _selectedDate!.month, i);
      String weekday = DateFormat('EEEE').format(currentDate);

      if (!weekdayCount.containsKey(weekday)) {
        weekdayCount[weekday] = 1;
      } else {
        weekdayCount[weekday]= weekdayCount[weekday]??0+1;
      }
    }
  }
}
