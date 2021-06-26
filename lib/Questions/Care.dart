import 'package:bliss/Questions/Welness.dart';
import 'package:bliss/constants.dart';
import 'package:flutter/material.dart';

import 'Benifits.dart';

class Care extends StatefulWidget {
  @override
  _CareState createState() => _CareState();
}

class _CareState extends State<Care> {
  @override
  Widget build(BuildContext context) {
    String care;
    return Scaffold(
      appBar: AppBar(
        title: Text("Self Test"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/dashboard', (route) => false);
            },
            child: Text("Home"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),

      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text("You get Medical Care at your Job",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Column(children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      care = "Yes";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Welness()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*1,

                      color: Colors.lightBlue,
                      child: Center(child: Text("Yes",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),

                    ),
                  ),
                ),
                SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    setState(() {
                      care = "No";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Welness()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*1,

                      color: Colors.lightBlue,
                      child: Center(child: Text("No",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),

                    ),
                  ),
                ),
                SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    setState(() {
                      care = "Not sure";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Welness()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*1,

                      color: Colors.lightBlue,
                      child: Center(child: Text("Not Sure",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),

                    ),
                  ),
                ),
              ],),
            ],
          ),
        ),


      ),
    );
  }
}
