import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_liveasy/localString.dart';
import './languageselector.dart';
import 'package:get/get.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(_liveEasy());
}

class _liveEasy extends StatelessWidget {
  const _liveEasy({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      translations: localString(),
      locale: Locale('en','US'),
      home:  languageSelector(),
      
    );
  }
}