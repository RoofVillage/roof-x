import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:full_screen_artboard_templates/index.dart';

class FieldsTestingArtboard extends FullScreenArtboard {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: FieldsTester(),
    );
  }
}

class FieldsTester extends StatefulWidget {
  FieldsTesterState createState() => FieldsTesterState();
}

class FieldsTesterState extends State<FieldsTester> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _updateText() async {
      // final DateTime newDate = await ArtboardNavigator.of(context).goTo(
      //     DatePickerFloatingArtboard(
      //       selectedDate: selectedDate,
      //     ),
      //     context: context);


      // setState(() {
      //   if (newDate != null) selectedDate = newDate;
      // });
    }

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: GestureDetector(
          onTap: () => _updateText(),
          child: Container(
            color: Colors.white12,
            height: 300,
            width: 300,
            child: Center(
              child: Text(
                selectedDate.day.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
