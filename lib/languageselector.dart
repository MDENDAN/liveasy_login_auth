import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import './localString.dart';
import './phone_no.dart';

class languageSelector extends StatefulWidget {
  languageSelector({super.key});

  @override
  State<languageSelector> createState() => _languageSelectorState();
}

class _languageSelectorState extends State<languageSelector> {
  static const _duration = [3000, 5000];
  static const _backgroundColor = [Color(0xFF93D2F3), Color(0xFF000000)];
  static const _highPercentage = [0.65, 0.66];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/gallery.png',
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 25, bottom: 10),
          child: Text(
            'one'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'two'.tr,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          'three'.tr,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            width: 250,
            padding: EdgeInsets.only(right: 8, left: 8, top: 2, bottom: 2),
            decoration:
                BoxDecoration(border: Border.all(color: Color(0xFF2F3037))),
            child: DropdownButtonabc()),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2E3B62), fixedSize: Size(250, 25)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhoneNumber(),
                  ));
            },
            child: Text('Next',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
      ],
    ));
  }
}

class DropdownButtonabc extends StatefulWidget {
  const DropdownButtonabc({super.key});

  @override
  State<DropdownButtonabc> createState() => _DropdownButtonabcState();
}

class _DropdownButtonabcState extends State<DropdownButtonabc> {
  List<String> items = ['English', 'Hindi'];
  String dropdownValue = 'English';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(
        'Select your language',
        style: TextStyle(color: Colors.black),
      ),
      value: dropdownValue,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(child: Text(value), value: value);
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          if (dropdownValue == 'Hindi') {
            var locale = Locale('hi', 'IN');
            Get.updateLocale(locale);
          } else {
            var locale = Locale('en', 'US');
            Get.updateLocale(locale);
          }
        });
      },
    );
  }
}
