
import 'package:bliss/Questions/testhealth_Age.dart';
import 'package:bliss/Screen/Appointment.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:bliss/constants.dart';
import 'package:bliss/Navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'GetMusic.dart';
import 'MusicPlayer.dart';
import 'DetailsPage.dart';



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/dashboard', (route) => false);
    } else if (_selectedIndex == 1) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/diary', (route) => false);
    } else if (_selectedIndex == 3) {
      //TODO profile page
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/profile', (route) => false);
    } else if (_selectedIndex == 2) {
      //TODO profile page
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/socialmedia', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {

    Size mq = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, '/playpage');
        },
        child: Icon(Icons.play_arrow_outlined),
        elevation: 2.0,
      ),
      bottomNavigationBar: NavigationBar(
        onTabSelected: _selectedTab,
        items: [
          CustomAppBarItem(icon: Icons.home_outlined),
          CustomAppBarItem(icon: Icons.local_hospital_outlined),
          CustomAppBarItem(icon: FontAwesomeIcons.userFriends),
          CustomAppBarItem(icon: Icons.person),
        ],
        page: _selectedIndex,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Image(
                  image: AssetImage('assets/bg.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Text(
                                'Hello Dear, ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(' Hope you are doing great today!!!',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: mainColor),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ]),
              SingleChildScrollView( 
                child: Container(
                  height: mq.height * 0.65,
                  width: mq.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(2, 0),
                            color: Colors.black26,
                            blurRadius: 8.0)
                      ]),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: InkWell(
                              onTap: (){

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TestHealth()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 75,
                                  width: MediaQuery.of(context).size.width*1,

                                  color: Colors.lightBlue,
                                  child: Center(child: Text("Take a self-test", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w700),)),

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),

                          Text(
                            'Doctors',
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            //TODO 1
                              padding: const EdgeInsets.symmetric(vertical: 1.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 20.0),
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.24,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: doctors.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.6,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          color: mainColor,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10.0, top: 25),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        doctors[index],
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        spec[index],
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
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
                                                                  "Book",
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
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(builder: (context) =>Appointment()),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          // SizedBox(
                                                          //   height: 5.00,
                                                          // ),
                                                          // SizedBox(
                                                          //   height: 20,
                                                          //   width: 100,
                                                          //   child: RaisedButton(
                                                          //     child: Center(
                                                          //       child: Text(
                                                          //         "Chat",
                                                          //         style: TextStyle(
                                                          //           color: mainColor,
                                                          //         ),
                                                          //       ),
                                                          //     ),
                                                          //     elevation: 5.0,
                                                          //     color: Colors.white,
                                                          //     shape: RoundedRectangleBorder(
                                                          //       borderRadius: BorderRadius.circular(30.0),
                                                          //     ),
                                                          //     onPressed: () {
                                                          //       Navigator.pushNamed(context, '/chat');
                                                          //     },
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Container(
                                                  height: 75,
                                                    width: 75,
                                                    child: Image(image: AssetImage('assets/profile.jpg')))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Music',
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            //TODO 1
                              padding: const EdgeInsets.symmetric(vertical: 1.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 20.0),
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.22,
                                child:

                                ListView(
                                    scrollDirection: Axis.horizontal,

                                    children: [
                                       Container(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.6,
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
                                                        'Dancing Star',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'XYZ Band',
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
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(builder: (context) => PlayPage()),
                                                                );
                                                              },
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
                                                      child: Image(image: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/61seTW3HcDL._SL1001_.jpg')))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.6,
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
                                                        'Rainfall',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Wallflower Band',
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
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(builder: (context) => PlayPage()),
                                                                );
                                                              },
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
                                                      child: Image(image: NetworkImage('https://www.thoughtco.com/thmb/e-lNG0rEXRiAfHNtR6RLOL98XPo=/2576x2576/smart/filters:no_upscale()/drops-of-rain-on-glass-838815210-5a823cc0a18d9e0036e325e2.jpg')))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.6,
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
                                                        'Mind Peace',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Flower Band',
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
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(builder: (context) => PlayPage()),
                                                                );
                                                              },
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
                                                      child: Image(image: NetworkImage('https://specials-images.forbesimg.com/imageserve/5f0dde7ede49b00006d70680/960x0.jpg?cropX1=0&cropX2=1375&cropY1=114&cropY2=1312')))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.6,
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
                                                        'Mindfullness',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Power Band',
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
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(builder: (context) => PlayPage()),
                                                                );
                                                              },
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
                                                      child: Image(image: NetworkImage('https://www.universityofcalifornia.edu/sites/default/files/uc-berkeley-wandering-mind-study.jpg')))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.6,
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
                                                        'Deep Sleep',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Welness Band',
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
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(builder: (context) => PlayPage()),
                                                                );
                                                              },
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
                                                      child: Image(image: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/how-much-sleep-do-i-need-1616108262.jpg')))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],),
                              )),


                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }}