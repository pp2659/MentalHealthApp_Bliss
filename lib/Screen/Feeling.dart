import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'dashboard.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

final _firestore = FirebaseFirestore.instance;

class Feeling extends StatefulWidget {
  @override
  _FeelingState createState() => _FeelingState();
}

class _FeelingState extends State<Feeling> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  double finalrating=3;
  _populateData() async {
    DateTime date = DateTime(2021, 4, 1);
    Random rand = Random();
    Feelings feelings = Feelings(feelDetail: []);
    _firestore
        .collection('feeling')
        .doc(auth.currentUser.uid)
        .get()
        .then((value) async {
      print("done");

      if (value.exists) {
        feelings = Feelings.fromJson(value.data());
      }
    });
    for (int i = 1; i < 30; i++) {
      feelings.feelDetail.add(FeelDetail(
          feel: double.parse((rand.nextInt(4) + 1).toString()),
          date: DateTime(2021, 3, i).toIso8601String()));

    }
    await _firestore
        .collection('feeling')
        .doc(auth.currentUser.uid)
        .set(feelings.toJson());

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _populateData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Center(
                      child: RatingBar.builder(
                    initialRating: 3,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      switch (index) {
                        // ignore: missing_return
                        case 0:
                          return Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.red,
                          );
                        case 1:
                          return Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.redAccent,
                          );
                        case 2:
                          return Icon(
                            Icons.sentiment_neutral,
                            color: Colors.amber,
                          );
                        case 3:
                          return Icon(
                            Icons.sentiment_satisfied,
                            color: Colors.lightGreen,
                          );
                        case 4:
                          return Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.green,
                          );
                      }
                    },
                    onRatingUpdate: (rating) {
                      finalrating = rating;
                      print(rating);
                    },
                  )),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "How are you feeling\ntoday?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                ),
                Container(
                  height: 1.4 * (MediaQuery.of(context).size.height / 20),
                  width: 5 * (MediaQuery.of(context).size.width / 10),
                  margin: EdgeInsets.only(top: 120),
                  child: RaisedButton(
                    elevation: 5.0,
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      print(finalrating);
                      _firestore
                          .collection('feeling')
                          .doc(auth.currentUser.uid)
                          .get()
                          .then((value) async {
                        print("done");
                        Feelings feelings = Feelings(feelDetail: []);
                        if (value.exists) {
                          feelings = Feelings.fromJson(value.data());
                        }

                        feelings.feelDetail.add(FeelDetail(
                            feel: finalrating,
                            date: DateTime.now().toIso8601String()));
                        await _firestore
                            .collection('feeling')
                            .doc(auth.currentUser.uid)
                            .set(feelings.toJson());
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                    child: Text(
                      "Let's start",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: MediaQuery.of(context).size.height / 40,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
// To parse this JSON data, do
//
//     final feelings = feelingsFromJson(jsonString);

Feelings feelingsFromJson(String str) => Feelings.fromJson(json.decode(str));

String feelingsToJson(Feelings data) => json.encode(data.toJson());

class Feelings {
  Feelings({
    this.feelDetail,
  });

  List<FeelDetail> feelDetail;

  factory Feelings.fromJson(Map<String, dynamic> json) => Feelings(
        feelDetail: List<FeelDetail>.from(
            json["feelDetail"].map((x) => FeelDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "feelDetail": List<dynamic>.from(feelDetail.map((x) => x.toJson())),
      };
}

class FeelDetail {
  FeelDetail({
    this.feel,
    this.date,
  });

  double feel;
  String date;

  factory FeelDetail.fromJson(Map<String, dynamic> json) => FeelDetail(
        feel: double.parse(json["feel"].toString()),
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "feel": feel,
        "date": date,
      };
}
