import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bliss/constants.dart';
import 'dart:ui';

import 'package:webview_flutter/webview_flutter.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  WebViewController _controller;
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
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
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
                              'User Details',
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
                  Container(
                    height: 600,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 40.0),
                      child: WebView(
                        initialUrl: 'about:blank',
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (WebViewController webViewController) {
                          _controller = webViewController;
                          _loadHtmlFromAssets();
                        },
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
  _loadHtmlFromAssets()  {

    _controller.loadUrl( "https://docs.google.com/forms/d/e/1FAIpQLSe-VGoY0XhY7NTjQj1UeDQxmqLNemDD0ed0PbQhZq_UlRQTCg/viewform?usp=sf_link");
  }
}