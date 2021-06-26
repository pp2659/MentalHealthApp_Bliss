import 'package:bliss/Questions/Benifits.dart';
import 'package:bliss/Questions/techCompany.dart';
import 'package:bliss/constants.dart';
import 'package:flutter/material.dart';

class Remort extends StatefulWidget {
  @override
  _RemortState createState() => _RemortState();
}

class _RemortState extends State<Remort> {
  @override
  Widget build(BuildContext context) {
    String remote;
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
                child: Text("Are you doing a Remote Job?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Column(children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      remote = "Yes";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Tech()));
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
                      remote = "No";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Tech()));
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

              ],),
            ],
          ),
        ),


      ),
    );
  }
}
