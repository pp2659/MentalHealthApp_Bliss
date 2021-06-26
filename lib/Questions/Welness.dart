import 'package:bliss/Questions/seekHelp.dart';
import 'package:bliss/constants.dart';
import 'package:flutter/material.dart';

import 'Care.dart';

class Welness extends StatefulWidget {
  @override
  _WelnessState createState() => _WelnessState();
}

class _WelnessState extends State<Welness> {
  @override
  Widget build(BuildContext context) {
    String welness;
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
                child: Text("Are you a part of Wellness Program?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Column(children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      welness = "Yes";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Help()));
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
                      welness = "No";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Help()));
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
                      welness = "Don't know";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Help()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*1,

                      color: Colors.lightBlue,
                      child: Center(child: Text("Don't Know ",
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
