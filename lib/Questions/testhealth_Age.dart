import 'package:bliss/Questions/ResultScreen.dart';

import 'package:bliss/constants.dart';
import 'package:flutter/material.dart';
import 'package:bliss/constants.dart';

class TestHealth extends StatefulWidget {
  @override
  _TestHealthState createState() => _TestHealthState();
}

class _TestHealthState extends State<TestHealth> {
  String age;
  int selectedQuestion = 0;
  Map body = {};
  Map map = {
    "Age": 37,
    "Gender": "F",
    "benefits": "Yes",
    "care_options": "Not sure",
    "family_history": "No",
    "leave": "Somewhat easy",
    "mental_health_consequence": "No",
    "phys_health_consequence": "No",
    "remote_work": "No",
    "seek_help": "Yes",
    "tech_company": "Yes",
    "wellness_program": "No"
  };
  Widget question;
  TextStyle textStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white);
  @override
  void initState() {
    super.initState();
    question = getAge();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Self Test"),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/dashboard', (route) => false);
              },
              child: Text("Home"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
        body: question);
  }

  getAge() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Enter your Age",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your Age',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your Age';
                }
                return null;
              },
              onChanged: (newValue) {
                body['Age'] = int.parse(newValue);
              },
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    question = getGender();
                  });
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.lightBlue,
                )),
          ],
        ),
      ),
    );
  }

  getGender() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Select your Gender",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['Gender'] = "Female";
                      question = getHistory();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Female",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['Gender'] = "Male";
                      question = getHistory();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Male",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['Gender'] = "Transgender";
                      question = getHistory();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Prefer not say",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getHistory() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Do you have a record of Family History?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['family_history'] = "Yes";
                      question = getJob();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Yes",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['family_history'] = "No";
                      question = getJob();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "No",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getJob() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Are you doing a Remote Job?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['remote_work'] = "Yes";
                      question = getTechCompany();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Yes",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['remote_work'] = "No";
                      question = getTechCompany();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "No",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getTechCompany() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Are you doing a job in a Tech Company?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['tech_company'] = "Yes";
                      question = getBenifits();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Yes",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['tech_company'] = "No";
                      question = getBenifits();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "No",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getBenifits() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Do you Benifits in Job?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['benefits'] = "Yes";
                      question = getCare();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Yes",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['benefits'] = "No";
                      question = getCare();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "No",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['benefits'] = "Don't know";
                      question = getCare();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Don't Know ",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getCare() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "You get Medical Care at your Job",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['care_options'] = "Yes";
                      question = getwellNess();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Yes",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['care_options'] = "No";
                      question = getwellNess();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "No",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['care_options'] = "Not sure";
                      question = getwellNess();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Not Sure",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getwellNess() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Are you a part of Wellness Program?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['wellness_program'] = "Yes";
                      question = getSeekHelp();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Yes",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['wellness_program'] = "No";
                      question = getSeekHelp();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "No",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['wellness_program'] = "Don't know";
                      question = getSeekHelp();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Don't Know ",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getSeekHelp() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Have you ever seek professional help?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['seek_help'] = "Yes";
                      question = getLeave();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Yes",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['seek_help'] = "No";
                      question = getLeave();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "No",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['seek_help'] = "Don't know";
                      question = getLeave();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Don't Know ",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getLeave() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "How easy it is to get a leave from your job?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['leave'] = "Very easy";
                      question = getMentalHealth();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Very easy",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['leave'] = "Somewhat easy";
                      question = getMentalHealth();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Somewhat easy",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['leave'] = "Don't know";
                      question = getMentalHealth();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Don't Know ",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['leave'] = "Somewhat difficult";
                      question = getMentalHealth();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Somewhat difficult",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['leave'] = "Very difficult";
                      question = getMentalHealth();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Very difficult",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getMentalHealth() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Have you ever had mental health consequences?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['mental_health_consequence'] = "Yes";
                      question = getPhysicalHeath();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Yes",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['mental_health_consequence'] = "No";
                      question = getPhysicalHeath();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "No",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['mental_health_consequence'] = "Maybe";
                      question = getPhysicalHeath();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Maybe",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getPhysicalHeath() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "Have you ever had physical health consequences?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      body['phys_health_consequence'] = "Yes";
                    });
                    print(body);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(body: body)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Yes",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['phys_health_consequence'] = "No";
                    });
                    print(body);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(body: body)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "No",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      body['phys_health_consequence'] = "Maybe";
                    });
                    print(body);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(body: body)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.lightBlue,
                      child: Center(
                          child: Text(
                        "Maybe",
                        style: textStyle,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
