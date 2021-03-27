import 'package:budget_tracker_ui/json/day_month.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../theme/colors.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(children: [
        Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              )
            ]),
            // ta3 el container
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              // ta3 el padding
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Transaction",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(days.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: Container(
                            width: ((size.width - 40) / 7),
                            child: Column(
                              children: [
                                Text(
                                  days[index]["label"],
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: activeDay == index
                                          ? primary
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: activeDay == index
                                              ? primary
                                              : black.withOpacity(0.1))),
                                  child: Center(
                                    child: Text(
                                      days[index]["day"],
                                      style: TextStyle(
                                          color: activeDay == index
                                              ? white
                                              : black.withOpacity(0.1),
                                          fontSize: 10),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            )),
      ]),
    );
  }
}
