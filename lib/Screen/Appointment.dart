import 'package:bliss/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bliss/widgets/extention.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

final _firestore = FirebaseFirestore.instance; // firebase package is imported
final FirebaseAuth auth = FirebaseAuth.instance;

class Appointment extends StatefulWidget {
  final String name, email;

  const Appointment({Key key, this.name, this.email}) : super(key: key);
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String name, age, phoneNumber, reason, time;
  String dropdownValue;
  DateTime dateTime = DateTime.now();
  Widget build(BuildContext context) {
    return Scaffold(
      //the main area under which all the widgets are present

      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Appointment Request"),
      ),
      body: Container(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 2,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(
                    "https://image.freepik.com/free-photo/close-up-white-poster-texture_293060-1697.jpg"), // Image is taken fromm internet throught the url
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 35,
            bottom: 40,
            child: SingleChildScrollView(
              child: Container(
                // height: 600,
                width: 500,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Add an Appointment with\n${widget.name}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                letterSpacing: 1,
                                height: 1.6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select Date",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var d = await showDatePicker(
                                        context: context,
                                        initialDate: dateTime,
                                        firstDate: DateTime.now(),
                                        lastDate:
                                            DateTime(DateTime.now().year + 1));
                                    if (d != null) {
                                      setState(() {
                                        dateTime = d;
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue.withOpacity(0.1),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          dateTime.format("d-M-Y  "),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Icon(
                                          Icons.calendar_today,
                                          size: 20,
                                          color: Colors.blue,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select Time",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var d = await showTimePicker(
                                        context: context,
                                        initialTime:
                                            TimeOfDay.fromDateTime(dateTime));
                                    if (d != null) {
                                      setState(() {
                                        dateTime = dateTime.setTimeOfDay(d);
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue.withOpacity(0.1),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          dateTime.format("h:i A  "),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Icon(
                                          Icons.schedule,
                                          size: 20,
                                          color: Colors.blue,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       "Time:",
                          //       style: TextStyle(
                          //         fontSize: 20,
                          //         color: Colors.lightBlue,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // TextFormField(
                          //   keyboardType: TextInputType.name,
                          //   decoration: InputDecoration(
                          //     hintText: 'Enter your time',
                          //   ),
                          //   validator: (value) {
                          //     if (value.isEmpty) {
                          //       return 'Please enter the time';
                          //     }
                          //     return null;
                          //   },
                          //   onChanged: (newValue) {
                          //     time = newValue;
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 8,
                          // ),
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       "Select Doctor",
                          //       style: TextStyle(
                          //         fontSize: 20,
                          //         color: Colors.lightBlue,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // DropdownButton<String>(
                          //   value: dropdownValue,
                          //   hint: Text("Doctor"),
                          //   icon: const Icon(
                          //     Icons.arrow_downward,
                          //     color: Colors.lightBlue,
                          //   ),
                          //   iconSize: 24,
                          //   elevation: 16,
                          //   style: const TextStyle(color: Colors.lightBlue),
                          //   underline: Container(
                          //     height: 2,
                          //     color: Colors.lightBlue,
                          //   ),
                          //   onChanged: (String newValue) {
                          //     setState(() {
                          //       dropdownValue = newValue;
                          //     });
                          //   },
                          //   items: <String>[
                          //     'P.Sharma',
                          //     'Aditya Narayan',
                          //     'S.Naidu',
                          //     'P.Paul',
                          //     'Harsh'
                          //   ].map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              height: 45,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                    child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                                color: Colors.lightBlue,
                                textColor: Colors.white,
                                onPressed: () {
                                  //storing data to firebase
                                  sendMail();
                                  // _firestore
                                  //     .collection('appointmentdoc')
                                  //     .doc(auth.currentUser.uid)
                                  //     .collection(name)
                                  //     .add({
                                  //   'name': name,
                                  //   'age': age,
                                  //   'phonenumber': phoneNumber,
                                  //   'reason': reason,
                                  //   'time': time,
                                  //   'doctorname': dropdownValue,
                                  // }).then((value) => print(value.id));
                                  // print("pressed");
                                  // _scaffoldKey.currentState
                                  //     .showSnackBar(new SnackBar(
                                  //   //shows the snackbar at the bottom
                                  //   content: new Text('Request Submitted'),
                                  // ));
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  sendMail() async {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text("Adding Your Appointment..."),
              content: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ));
    String username = 'htmbliss@gmail.com';
    String password = 'bliss98765';

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, "Bliss App")
      ..recipients.add(widget.email)
      ..subject = 'Appointment Notification ${dateTime.format("d-M-Y  h:i A ")}'
      ..html = '''<h2>Name :&nbsp;<strong>$name</strong></h2>
        <h2>Age <strong>: $age</strong></h2>
        <h2>Mobile <strong>: $phoneNumber</strong></h2>
        <h2>Date and Time <strong>: ${dateTime.format("d-M-Y  h:i A ")}</strong></h2>
        <h3><em><strong>Reason</strong></em></h3>
        <ul>
          <li><em><strong>$reason</strong></em></li>
        </ul>
        <p><em><strong>​</strong></em></p>
        <blockquote>
        <p><tt>send from Bliss App</tt></p>
        </blockquote>
        <p>&nbsp;</p>''';

    try {
      final sendReport = await send(message, smtpServer);

      print('Message sent: ' + sendReport.toString());
      Navigator.pop(context);
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        //shows the snackbar at the bottom
        content: new Text('Request Submitted'),
      ));
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
