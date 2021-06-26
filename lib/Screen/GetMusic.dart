import 'package:flutter/material.dart';

import '../constants.dart';

class GetMusic extends StatelessWidget {
  GetMusic({@required this.songname, this.bandname, this.onPress, this.imagepath});
  final String songname;
  final String bandname;
  final Function onPress;
  final String imagepath;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 5,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(20)),
          ),
          color: mainColor,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        songname,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bandname,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                            width: 100,
                            child: RaisedButton(
                              child: Center(
                                child: Text(
                                  "Play Now",
                                  style: TextStyle(
                                    color: mainColor,
                                  ),
                                ),
                              ),
                              elevation: 5.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: onPress,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Container(
                      height: 75,
                      width: 75,
                      child: Image(image: AssetImage(imagepath)))
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

