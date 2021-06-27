import 'package:bliss/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bliss/widgets/extention.dart';
final _firestore= FirebaseFirestore.instance; // firebase package is imported
final FirebaseAuth auth = FirebaseAuth.instance;
class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String name, age, phoneNumber, reason,time;
  String dropdownValue ;
  DateTime dateTime = DateTime.now();
  Widget build(BuildContext context) {
    return Scaffold( //the main area under which all the widgets are present

      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Appointment Request"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 3,
                  width: MediaQuery.of(context).size.width * 2,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: NetworkImage(
                          "https://image.freepik.com/free-photo/close-up-white-poster-texture_293060-1697.jpg"),// Image is taken fromm internet throught the url
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding( //for giving some space around the widget
                  padding: const EdgeInsets.only(left: 12.0, right: 12, top: 80),
                  child: Container(
                    height: 600,
                    width: 500,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Name:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your name',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Name';
                                  }
                                  return null;
                                },
                                onChanged: (newValue) {
                                  name = newValue; //saves the value to name
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Age:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                ),
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
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Phone Number:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Number',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Number';
                                  }
                                  return null;
                                },
                                onChanged: (newValue) {
                                  phoneNumber = newValue;
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Reason:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Reason',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Reason';
                                  }
                                  return null;
                                },
                                onChanged: (newValue) {
                                  reason = newValue;
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time:",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              ),

                              TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: 'Enter your time',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter the time';
                                  }
                                  return null;
                                },
                                onChanged: (newValue) {
                                  time = newValue;
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Select Doctor",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              ),
                           DropdownButton<String>(
                            value: dropdownValue,
                            hint: Text("Doctor"),
                            icon: const Icon(Icons.arrow_downward, color: Colors.lightBlue,),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.lightBlue),
                            underline: Container(
                              height: 2,
                              color: Colors.lightBlue,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),


                              SizedBox(height: 30,),
                              Center(
                                child: RaisedButton(
                                  child: Text("Submit"),
                                  color: Colors.lightBlue,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    //storing data to firebase
                                    _firestore.collection('appointmentdoc').doc(auth.currentUser.uid).collection(name).add(
                                        {
                                          'name':name,
                                          'age':age,
                                          'phonenumber':phoneNumber,
                                          'reason':reason,
                                          'time': time,
                                          'doctorname': dropdownValue,
                                        }
                                    ).then((value) => print(value.id));
                                    print("pressed");
                                    _scaffoldKey.currentState.showSnackBar(
                                        new SnackBar( //shows the snackbar at the bottom
                                          content: new Text('Request Submitted'),
                                        )
                                    );
                                  },),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}