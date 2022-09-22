import 'package:flutter/material.dart';
import './languageselector.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final phoneNumberController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CloseButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(fontSize: 22),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 10),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
