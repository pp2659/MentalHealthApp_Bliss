import 'package:bliss/constants.dart';
import 'package:flutter/material.dart';

import 'Care.dart';

class Benifits extends StatefulWidget {
  @override
  _BenifitsState createState() => _BenifitsState();
}

class _BenifitsState extends State<Benifits> {
  @override
  Widget build(BuildContext context) {
    String benifit;
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
                child: Text("Do you Benifits in Job?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Column(children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      benifit = "Yes";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Care()));
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
                      benifit = "No";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Care()));
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
                      benifit = "Don't know";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Care()));
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
