import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import './otp.dart';

bool showLoading = true;

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

MobileVerificationState currentState =
    MobileVerificationState.SHOW_MOBILE_FORM_STATE;

class PhoneNumber extends StatefulWidget {
  static String verify = "";

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController _controller = TextEditingController();

  var phone;
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
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                'four'.tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'five'.tr,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 35,
            ),
            // SizedBox(
            //     width: 300,
            //     child: TextField(
            //       child: <Widget>[
            //         SizedBox(
            //           width: 110,
            //           child: CountryPhoneCodePicker.withDefaultSelectedCountry(
            //             defaultCountryCode: Country(
            //                 name: 'India', countryCode: 'IN', phoneCode: '+91'),
            //             borderRadius: 5,
            //             borderWidth: 1,
            //             showPhoneCode: true,
            //             borderColor: Colors.grey,
            //             style: const TextStyle(fontSize: 16),
            //             searchBarHintText: 'Search by name',
            //             countryPhoneCodeTextStyle: TextStyle(
            //                 fontSize: 20, fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ],
            //       keyboardType: TextInputType.phone,
            //       decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           hintText: 'Mobile Number',
            //           hintStyle: TextStyle(fontSize: 22),
            //           prefixIcon: Padding(
            //             padding: EdgeInsets.only(
            //                 top: 20, bottom: 20, left: 20, right: 10),
            //           )),
            //       cursorHeight: 18,
            //     )),
            SizedBox(
              width: 320,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntlPhoneField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      hintStyle: TextStyle(fontSize: 22),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      prefixStyle: TextStyle(fontSize: 50)),
                  initialCountryCode: 'IN',
                  onChanged: (value) {
                    phone = value;
                  },
                ),
              ),
            ),

            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E3B62), fixedSize: Size(300, 45)),
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: _controller as String,
                  verificationCompleted:
                      (PhoneAuthCredential credential) async {
                    setState(() {
                      showLoading = false;
                    });
                  },
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) async {
                    setState(() {
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORM_STATE;
                      PhoneNumber.verify = verificationId;
                    });
                    Navigator.pushNamed(
                        context, otp(_controller.text).toString());
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (otp(_controller.text)),
                    ));
              },
              child: Text('CONTINUE',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            )
          ],
        )));
  }
}

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       key: _scaffoldKey,
//       body: Container(
//         child: showLoading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
//                 ? otp(context)
//                 : otp(context),
//         padding: const EdgeInsets.all(16),
//       ));
// }
