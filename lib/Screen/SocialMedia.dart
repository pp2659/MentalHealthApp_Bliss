import 'package:bliss/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dashboard.dart';
import 'Diary.dart';
import 'profile.dart';


import '../Navbar.dart';



class SocialMedia extends StatefulWidget {

  @override
  _SocialMediaState createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {


  int _selectedIndex = 2;

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
      appBar: AppBar(
          title:(Text("Enjoy the posts")),
        backgroundColor: mainColor,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 4),
                children: [
                  buildPostSection(
                      "https://pbs.twimg.com/media/Ej6e9txWAAAnRsk.jpg",
                      "https://static.vecteezy.com/system/resources/previews/000/659/781/non_2x/vector-beautiful-flower-icon.jpg"),
                  buildPostSection(
                      "https://www.pngkalas.com/wp-content/uploads/2021/02/Mental-Health-Poster-Design-1024x1024.png",
                      "https://static.vecteezy.com/system/resources/previews/001/190/578/non_2x/flower-icon-png.png"),
                  buildPostSection(
                      "https://www.thenewshouse.com/wp-content/uploads/self-caretip6.png",
                      "https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/512x512/plain/flower.png"),
                  buildPostSection(
                      "https://www.adventhealth.com/sites/default/files/styles/scale1600/public/media/mental-health-for-teachers.jpg?itok=4phzJ_CO",
                      "https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/512x512/plain/flower.png"),
                ],
              ),
            )
          ],
        ),
      ),



    );
  }



  Container buildPostSection(String urlPost, String urlProfilePhoto) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPostFirstRow(urlProfilePhoto),
          SizedBox(
            height: 10,
          ),
          buildPostPicture(urlPost),
          SizedBox(
            height: 5,
          ),
          // Text(
          //   "963 likes",
          //   style: TextStyle(
          //       fontSize: 17,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.grey[800]),
          // ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Row buildPostFirstRow(String urlProfilePhoto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              // onTap: (){
              //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProfilPage( url: urlProfilePhoto)));
              // },
              child: Hero(
                tag: urlProfilePhoto,
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(urlProfilePhoto),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Tip for Happiness",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            )
          ],
        ),
        Icon(Icons.more_vert)
      ],
    );
  }
  Color _favIconColor = Colors.white.withOpacity(0.7);
  Stack buildPostPicture(String urlPost) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlPost),
              )),
        ),
        // Positioned(
        //   bottom: 20,
        //   right: 20,
        //
        //
        //   child: IconButton(
        //     icon: Icon(Icons.favorite),
        //     color: _favIconColor,
        //     iconSize: 35,
        //     onPressed: () {
        //       setState(() {
        //         if(_favIconColor == Colors.white.withOpacity(0.7)){
        //           _favIconColor = Colors.red;
        //         }else{
        //           _favIconColor = Colors.white.withOpacity(0.7);
        //         }
        //       });
        //     },
        //   ),
        // )
      ],
    );
  }

  Container buildStoryAvatar(String url) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      height: 60,
      width: 60,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.red),
      child: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}