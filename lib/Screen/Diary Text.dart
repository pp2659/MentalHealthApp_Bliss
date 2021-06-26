import 'package:bliss/Screen/Diary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bliss/constants.dart';
import 'dart:ui';
final _firestore= FirebaseFirestore.instance;
class DiaryText extends StatefulWidget {
  @override
  _DiaryTextState createState() => _DiaryTextState();
}

class _DiaryTextState extends State<DiaryText> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String name='',mobile='',doctor='',reason='',time='',height='',weight='',address='',blood='',email='';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff2f3f7),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.34,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg1.png'),
                      colorFilter: new ColorFilter.mode(
                          Colors.white.withOpacity(0.2), BlendMode.dstATop),
                      fit: BoxFit.fill,
                    ),
                    color: Color(0xfff2f3f7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(0),
                      bottomRight: const Radius.circular(0),
                    ),
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 25, height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Journal()));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 20),
                            Text(
                              'Write your thoughts!!',
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            // SizedBox(
                            // width: 60,
                            // ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Icon(
                            //     Icons.notifications,
                            //     color: Colors.black,
                            //     size: 24.0,
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // Container(
                            //   height: 80,
                            //   width: 80,
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //         image: NetworkImage(
                            //             "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70"),
                            //         fit: BoxFit.fill,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 40.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(
                                "Diary Entry",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                minLines: 4,
                                maxLines: 7,
                                cursorColor: mainColor,
                                decoration: InputDecoration(
                                  focusColor: mainColor,
                                  fillColor: mainColor,
                                  hoverColor: mainColor,
                                  hintText: 'Write here',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please some thoughts";
                                  }
                                  return null;
                                },
                                onChanged: (value){
                                  reason=value;
                                },
                              ),
                              SizedBox(height: 10,),

                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: .75 * (MediaQuery.of(context).size.height / 12),
                                      width: 6.1 * (MediaQuery.of(context).size.width / 15),
                                      //margin: EdgeInsets.only(bottom: 20),
                                      child: RaisedButton(
                                        elevation: 1.0,
                                        color: mainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                          side: BorderSide(color: mainColor),
                                        ),
                                        onPressed: () {
                                          print(reason);
                                          _firestore.collection('diary').doc(auth.currentUser.uid).collection('diary detail').add(
                                            {
                                              'name':'diary',
                                               'field':reason,
                                            }
                                          ).then((value) => print(value.id));

                                        },
                                        child: InkWell(
                                          onTap: (){
                                            print(reason);
                                            _firestore.collection('diary').doc(auth.currentUser.uid).collection('diary detail').add(
                                                {
                                                  'name':'diary',
                                                  'field':reason,
                                                }
                                            ).then((value) => print(value.id));
                                            print('successful');
                                            _scaffoldKey.currentState.showSnackBar(
                                                new SnackBar(
                                                    content: new Text('Diary Saved'),
                                                )
                                            );
                                          },
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Save',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}