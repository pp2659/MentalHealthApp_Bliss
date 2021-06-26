import 'package:bliss/Questions/ResultScreen.dart';
import 'package:bliss/constants.dart';
import 'package:flutter/material.dart';

import 'Care.dart';

class ph extends StatefulWidget {
  @override
  _phState createState() => _phState();
}

class _phState extends State<ph> {
  @override
  Widget build(BuildContext context) {
    String mental;
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
                child: Text("Have you ever had physical health consequences?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Column(children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      mental = "Yes";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Result()));
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
                      mental = "No";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Result()));
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
                      mental = "Maybe";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Result()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*1,

                      color: Colors.lightBlue,
                      child: Center(child: Text("Maybe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),

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
