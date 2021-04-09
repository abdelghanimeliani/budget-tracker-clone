import 'package:budget_tracker_ui/json/create_budget_json.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:budget_tracker_ui/widget/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreateBudgetPage extends StatefulWidget {
  _CreateBudgetPageState createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  int activateCategory = 0;
  TextEditingController budgetName = TextEditingController(text: "shooping");
  TextEditingController budgetCost = TextEditingController(text: "700.00");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  blurRadius: 3,
                  spreadRadius: 3,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, left: 20, right: 20, bottom: 25),
              child: Row(
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
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "chose category",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: black.withOpacity(0.5),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    activateCategory = index;
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: activateCategory == index
                                    ? primary
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(12),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.01),
                                blurRadius: 3,
                                spreadRadius: 3,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 20, top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: green.withOpacity(0.15),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Image.asset(
                                    categories[index]['icon'],
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                categories[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      )),
                );
              }),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "budget name",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: black.withOpacity(0.15)),
                ),
                TextField(
                  cursorColor: black,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "atcho chwia"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: size.width - 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "budget name",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: black.withOpacity(0.15)),
                          ),
                          TextField(
                            controller: budgetCost,
                            cursorColor: black,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "atcho chwia"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primary),
                      child: Icon(
                        Icons.arrow_forward,
                        color: white,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
