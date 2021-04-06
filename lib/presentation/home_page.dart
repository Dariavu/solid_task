import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:solid_task/core/const/color_constants.dart';
import 'package:solid_task/core/const/text_constants.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backgroundFirst = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          backgroundFirst = getRandomColor();
        });
      },
      child: Scaffold(
        backgroundColor: backgroundFirst,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.color_lens),
          backgroundColor: ColorConstants.DARK_SALMON,
          onPressed: () {
            showColorPicker();
          },
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.DARK_SALMON,
            ),
            child: Text(
              TextConstants.HI_THERE,
              style: TextStyle(
                color: ColorConstants.WHITE,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getRandomColor() {
    Color newColor = Color.fromRGBO(
        getRandomNumber(), getRandomNumber(), getRandomNumber(), 1);
    return newColor;
  }

  int getRandomNumber() {
    var random = new Random();
    return random.nextInt(255);
  }

  void showColorPicker() {
    var currColor = backgroundFirst;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: ColorConstants.PICKER_COLOR,
              onColorChanged: (color) {
                currColor = color;
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => backgroundFirst = currColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
