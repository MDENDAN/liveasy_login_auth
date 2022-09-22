import 'package:get/get.dart';

class localString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "one": 'Please select your Language',
          "two": 'You can change the language',
          'three': 'at any time',
          'four': 'Please enter your mobile number',
          'five': "You'll recieve a 4 digit code \nto verify next",
        },
        "hi_In": {
          "one": 'कृपया अपनी भाषा चुनें',
          "two": 'आप भाषा बदल सकते हैं',
          'three': 'किसी भी समय',
          'four': 'अपना मोबाइल नंबर दर्ज करें',
          'five': 'अगला सत्यापित करने के लिए आपको \n4 अंकों का कोड प्राप्त होगा'
        }
      };
}
