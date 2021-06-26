import 'package:bliss/Screen/dashboard.dart';
import 'package:flutter/material.dart';
class Result extends StatefulWidget {


  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body:Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width*0.8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("You are recommended to see a doctor. Take Care.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                  SizedBox(height: 50,),
                  InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Dashboard()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*1,

                        color: Colors.lightBlue,
                        child: Center(child: Text("Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
