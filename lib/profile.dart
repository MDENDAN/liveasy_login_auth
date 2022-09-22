import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String? profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.center,
          ),
          Text(
            'Please select your profile',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(border: Border.all()),
              child: RadioListTile(
                title: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                     Image.asset('assets/images/shipper.png' ,width: 68,height: 65,),
                   Expanded(child:
                      Column(
                       children: const <Widget>[
                         Padding(
                           padding: EdgeInsets.only(right:18.0),
                           child: Padding(
                             padding: EdgeInsets.only(right:110.0,bottom: 8),
                             child: Text(
                                "\nShipper",style: TextStyle(fontSize: 18),
                              ),
                           ),
                         ),
                        Expanded(child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',style: TextStyle(fontSize: 12),)),
                       ],
                     ),
            ),
                  ],
                ),
                value: "Shipper",
                groupValue: profile,
                onChanged: (value) {
                  setState(() {
                    profile = value.toString();
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(border: Border.all()),
              child: RadioListTile(
                title: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                     Image.asset('assets/images/Vector.png' ,width: 68,height: 65,),
                   Expanded(child:
                      Column(
                       children: const <Widget>[
                         Padding(
                           padding: EdgeInsets.only(right:18.0),
                           child: Padding(
                             padding: EdgeInsets.only(right:80.0,bottom: 8),
                             child: Text(
                                "\nTransporter",style: TextStyle(fontSize: 18),
                              ),
                           ),
                         ),
                        Expanded(child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',style: TextStyle(fontSize: 12),)),
                       ],
                     ),
            ),
                  ],
                ),
                
                value: "male",
                groupValue: profile,
                onChanged: (value) {
                  setState(() {
                    profile = value.toString();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
