import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_liveasy/phone_no.dart';
import 'package:login_liveasy/profile.dart';
import 'package:pinput/pinput.dart';

class otp extends StatefulWidget {
  final String phone;
  otp(this.phone);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var code = "";
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            iconTheme: IconThemeData(size: 30),
            backgroundColor: Colors.white,
            leading: IconButton(
              color: Colors.black,
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Verify Phone",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Text('Code is sent to '),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Pinput(
                    length: 6,
                    onChanged: (value) {
                      code = value;
                    },
                  ),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Didn\'t recieved the code? ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                        text: 'Resend again',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2E3B62),
                        fixedSize: Size(300, 45)),
                    onPressed: () async {
                      // Create a PhoneAuthCredential with the code
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: PhoneNumber.verify,
                              smsCode: code);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                    },
                    child: Text('VERIFY AND CONTINUE',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700))),
              ],
            ),
          ),
        ));
  }
}

// void _showSnackBar(String pin, BuildContext context) {
//   final snackBar = SnackBar(
//     duration: Duration(seconds: 5),
//     content: Container(
//         height: 80.0,
//         child: Center(
//           child: Text(
//             'Pin Submitted. Value: $pin',
//             style: TextStyle(fontSize: 25.0),
//           ),
//         )),
//     backgroundColor: Colors.greenAccent,
//   );
// }
