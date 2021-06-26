import 'package:bliss/AuthServ.dart';
import 'package:bliss/Navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constants.dart';
import 'Feeling.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  int _selectedIndex = 3;
  String email = "";
  @override
  void initState() {
    getEmai();
    super.initState();
    _getChartData();
  }
   List<FeelDetail> chartData = <FeelDetail>[

  ];
  _getChartData()async{
    FirebaseFirestore.instance.collection('feeling').doc(FirebaseAuth.instance.currentUser.uid).get().then((value) {
      chartData=Feelings.fromJson(value.data()).feelDetail;
      setState(() {

      });
    });
  }
  void getEmai() {
    User user = AuthenticationService.auth.currentUser;
    if (user != null) {
      setState(() {
        email = user.email;
      });
    } else {
      print("User Not registered!!!");
    }
  }

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/dashboard', (route) => false);
    } else if (_selectedIndex == 1) {
      Navigator.of(context).pushNamedAndRemoveUntil('/diary', (route) => false);
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          elevation: 0,
          // leading: GestureDetector(
          //   child: Image.asset('assets/top_icon.png'),
          //   onTap: () {},
          // ),
          title: Text(
            'Hello Dear',
            style: TextStyle(color: Colors.black),
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Container(
                  height: 214,
                  width: 214,
                  child: Image.asset(
                    'assets/profile.jpg',
                    fit: BoxFit.contain,
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              email,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),
           chartData.isNotEmpty? Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
             child: SfCartesianChart(
               primaryYAxis:  NumericAxis(

                   minimum: 0,
                   maximum: 6,
                   interval: 1,
                   majorTickLines: MajorTickLines(size: 0)),
                primaryXAxis: DateTimeAxis(majorGridLines: MajorGridLines(width: 0),),
               series: _getDefaultDateTimeSeries(),
              ),
           ):CircularProgressIndicator()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, '/playpage');
        },
        child: Icon(Icons.play_arrow_outlined),
        elevation: 2.0,
      ),
    );
  }
  List<LineSeries<FeelDetail, DateTime>> _getDefaultDateTimeSeries() {

    return <LineSeries<FeelDetail, DateTime>>[
      LineSeries<FeelDetail, DateTime>(

        dataSource: chartData,
        xValueMapper: (FeelDetail data, _) => DateTime.parse(data.date) ,
        yValueMapper: (FeelDetail data, _) => data.feel,
        color: mainColor,
      )
    ];
  }
}
