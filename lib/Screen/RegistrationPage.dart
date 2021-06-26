import 'package:bliss/AuthServ.dart';
import 'package:bliss/Screen/LoginPage.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email, password, cpassword, phoneNumber, username;

  Widget _buildLogo() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Image(
            width: 48,
            height: 44,
            image: AssetImage('assets/logo.png.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Text(
            'Bliss',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginSlider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                height: .75 * (MediaQuery.of(context).size.height / 20),
                width: 6.1 * (MediaQuery.of(context).size.width / 10),
                //margin: EdgeInsets.only(bottom: 20),
                child: RaisedButton(
                  elevation: 1.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: mainColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuthScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AuthScreen()),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 130),
              child: Container(
                height: .75 * (MediaQuery.of(context).size.height / 20),
                width: 3 * (MediaQuery.of(context).size.width / 10),
                margin: EdgeInsets.only(bottom: 20),
                child: RaisedButton(
                  elevation: 5.0,
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AuthScreen()),
                    // );
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: MediaQuery.of(context).size.height / 50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: mainColor,
            ),
            labelText: 'E-mail'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          //   borderSide: BorderSide(color: mainColor),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          //   borderSide: BorderSide(color: mainColor),
          // ),
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  // Widget _buildUsernameRow() {
  //   return Padding(
  //     padding: EdgeInsets.all(8),
  //     child: TextFormField(
  //       keyboardType: TextInputType.text,
  //       onChanged: (value) {
  //         setState(() {
  //           username = value;
  //         });
  //       },
  //       decoration: InputDecoration(
  //         // enabledBorder: OutlineInputBorder(
  //         //   borderRadius: BorderRadius.circular(20.0),
  //         //   borderSide: BorderSide(color: mainColor),
  //         // ),
  //         // focusedBorder: OutlineInputBorder(
  //         //   borderRadius: BorderRadius.circular(20.0),
  //         //   borderSide: BorderSide(color: mainColor),
  //         // ),
  //         focusColor: mainColor,
  //         prefixIcon: Icon(
  //           Icons.person,
  //           color: mainColor,
  //         ),
  //         labelStyle: TextStyle(color: Colors.black45),
  //         labelText: 'Username',
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildPhoneNumberRow() {
  //   return Padding(
  //     padding: EdgeInsets.all(8),
  //     child: TextFormField(
  //       initialValue: '+91',
  //       keyboardType: TextInputType.phone,
  //       onChanged: (value) {
  //         setState(() {
  //           phoneNumber = value;
  //         });
  //       },
  //       decoration: InputDecoration(
  //         // enabledBorder: OutlineInputBorder(
  //         //   borderRadius: BorderRadius.circular(20.0),
  //         //   borderSide: BorderSide(color: mainColor),
  //         // ),
  //         // focusedBorder: OutlineInputBorder(
  //         //   borderRadius: BorderRadius.circular(20.0),
  //         //   borderSide: BorderSide(color: mainColor),
  //         // ),
  //         prefixIcon: Icon(
  //           Icons.phone,
  //           color: mainColor,
  //         ),
  //         labelText: 'Phone',
  //       ),
  //     ),
  //   );
  // }

  Widget _buildConfirmPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            cpassword = value;
          });
        },
        decoration: InputDecoration(
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          //   borderSide: BorderSide(color: mainColor),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          //   borderSide: BorderSide(color: mainColor),
          // ),
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Confirm Password',
        ),
      ),
    );
  }

  // Widget _buildForgetPasswordButton() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       FlatButton(
  //         onPressed: () {},
  //         child: Text(
  //           "Forgot Password?",
  //           style: TextStyle(color: Colors.grey),
  //
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: .75 * (MediaQuery.of(context).size.height / 10),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
              AuthenticationService.createUserWithEmailandPassword(
                  email, password);
              print("successful1");
            },
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
                AuthenticationService.createUserWithEmailandPassword(
                    email, password);
                print("successful2");
              },
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'SignUp',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            '- OR -',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
            child: Icon(
              FontAwesomeIcons.facebook,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
            child: Icon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
            child: Icon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 2.0), //(x,y)
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView(
                children: [
                  _buildLoginSlider(),

                  _buildEmailRow(),

                  _buildPasswordRow(),
                  _buildConfirmPasswordRow(),
                  _buildOrRow(),
                  _buildSocialBtnRow(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildSignUpBtn() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Padding(
  //         padding: EdgeInsets.only(top: 40),
  //         child: FlatButton(
  //           onPressed: () {},
  //           child: RichText(
  //             text: TextSpan(children: [
  //               TextSpan(
  //                 text: 'Dont have an account? ',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: MediaQuery.of(context).size.height / 40,
  //                   fontWeight: FontWeight.w400,
  //                 ),
  //               ),
  //               TextSpan(
  //                 text: 'Sign Up',
  //                 style: TextStyle(
  //                   color: mainColor,
  //                   fontSize: MediaQuery.of(context).size.height / 40,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               )
  //             ]),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  final GlobalKey<ScaffoldState> skey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: skey,
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
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      image: NetworkImage(
                          "https://img.freepik.com/free-photo/cup-coffee-near-spectacles-clipboard-with-doctor-s-accessories-background_23-2148214013.jpg?size=626&ext=jpg"),
                      fit: BoxFit.fill,
                    ),
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(100),
                      bottomRight: const Radius.circular(100),
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  _buildLogo(),
                  _buildContainer(),
                  //  _buildSignUpBtn(),

                  SizedBox(
                    height: 20.0,
                  ),
                  _buildLoginButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
