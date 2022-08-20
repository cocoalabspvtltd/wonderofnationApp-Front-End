import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';



class ProgressionIndicator extends StatefulWidget {
  const ProgressionIndicator({Key? key}) : super(key: key);
  @override
  _ProgressionIndicatorState createState() => _ProgressionIndicatorState();
}
class _ProgressionIndicatorState extends State<ProgressionIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Linear Progression Indicator',style: TextStyle(color: Colors.black,fontSize: 20),),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LinearProgressIndicator(
              backgroundColor: Colors.orangeAccent,
              valueColor: AlwaysStoppedAnimation(ColorConstant.black900),
              minHeight: 25,
            ),
          ),
        ],
      ),
    );
  }
}