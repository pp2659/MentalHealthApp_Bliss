import 'package:bliss/Questions/Gender.dart';
import 'package:bliss/constants.dart';
import 'package:flutter/material.dart';
import 'package:bliss/constants.dart';

class TestHealth extends StatefulWidget {
  @override
  _TestHealthState createState() => _TestHealthState();
}

class _TestHealthState extends State<TestHealth> {
  @override
  Widget build(BuildContext context) {
    String age;
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
                child: Text("Enter your Age",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              TextFormField(


                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your Age',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Age';
                  }
                  return null;
                },
                onChanged: (newValue) {
                  age = newValue;

                },
              ),
              IconButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Gender()));

               }, icon: Icon(Icons.arrow_forward_ios, color: Colors.lightBlue,)),

            ],
          ),
        ),


      ),
    );
  }
}
