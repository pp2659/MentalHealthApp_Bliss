import 'dart:convert';
import 'dart:io';

import 'package:bliss/Screen/dashboard.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final Map body;

  const Result({Key key, this.body}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int result = -1;
  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  fetchApi() async {
    result = await getres();
    setState(() {});
  }

  Future<int> getres() async {
    String url = 'https://warm-dawn-99936.herokuapp.com/';
    Map map = widget.body;
    String respon = await apiRequest(url, map);
    print(respon);
    if (respon.contains("1")) {
      return 1;
    } else {
      return 0;
    }
  }

  Future<String> apiRequest(String url, Map jsonMap) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  result == -1
                      ? Column(
                          children: [
                            Text(
                              "Analysing your answers...",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ))
                          ],
                        )
                      : result == 1
                          ? Text(
                              "You are recommended to consult a doctor. Take Care.",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            )
                          : Text(
                              "Your mental health is stable But if you want you can always consult a doctor",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 1,
                        color: Colors.lightBlue,
                        child: Center(
                            child: Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )),
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
