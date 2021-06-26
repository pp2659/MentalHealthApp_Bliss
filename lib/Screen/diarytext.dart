import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryResult extends StatefulWidget
{
  String field;
  DiaryResult(this.field);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return DiaryResultState(field);
  }

}

class DiaryResultState extends State<DiaryResult> {
  String field;
  DiaryResultState(this.field);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Container(
          child: Stack(
            children: [
          Container(
          decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/diarybg.png'),
              fit: BoxFit.fill,
      ),),),

              Center(child: Text(
                field,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )),
      ],
    ),
          //child: Text(field))),
    )));
  }
}