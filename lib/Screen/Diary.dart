import 'package:bliss/Navbar.dart';
import 'package:bliss/Screen/diarytext.dart';
import 'package:bliss/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Diary Text.dart';

class Journal extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JournalState();
  }

}

class JournalState extends State<Journal> {
  int _selectedIndex = 1;
  final FirebaseAuth auth = FirebaseAuth.instance;
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
    // TODO: implement build
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, '/diarytext');
        },
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      body:  SingleChildScrollView(
        physics: ScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             Image(
              image: AssetImage('assets/bg.png'),
             ),
             Padding(
                 padding: EdgeInsets.all(0),
                 child: Image.asset('assets/journal.png'),
             ),
                SizedBox(
                  height: 10,
                ),
                Text('Diary',style: TextStyle(fontSize:24 ,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 15,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('diary').doc(auth.currentUser.uid).collection('diary detail').snapshots(),
                  builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                    if(!snapshot.hasData)
                      {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    return ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: snapshot.data.docs.map((document) {
                        return GestureDetector(
                          onTap: (){
                           Navigator.push(context,MaterialPageRoute(builder: (context)=>DiaryResult(document['field'])));
                          },
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 70,
                              child: Text("${document['name']}", style: TextStyle(
                                  color: mainColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
            ],
          ),
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

    );
  }
}