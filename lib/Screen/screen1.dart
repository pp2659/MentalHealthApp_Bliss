
import 'package:flutter/material.dart';
import '../constants.dart';
import 'LoginPage.dart';


class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image(
              width: 60,
              height: 60,
              image: AssetImage('assets/logo.png.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bliss',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'mental health matters',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(top: 400),
          child: RaisedButton(
            elevation: 5.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
            },
            child: Text(
              "Get Started",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Page1.png'),
                    fit: BoxFit.fill,
                  ),
                  color: mainColor,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                _title(),
                SizedBox(height: 25),
                _buildButton(),


                //  _buildSignUpBtn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}