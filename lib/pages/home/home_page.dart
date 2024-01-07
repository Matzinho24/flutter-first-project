
import 'package:connect/design/colors.dart';
import 'package:connect/pages/home/home_page_body.dart';
import 'package:connect/widgets/header_text.dart';
import 'package:connect/widgets/standard_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //dropdown
                  Column(
                    children: [
                      HeaderText(text: 'Connect'),
                      Row(
                        children: [
                          StandardText(text: 'Austria'),
                          Icon(Icons.arrow_drop_down_rounded)
                          //StandardText(text: 'Deutschland'),
                          //StandardText(text: 'Schweiz')
                        ],
                      )
                    ],
                  ),
                  //icon
                  Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Icon(Icons.search, color: Colors.white),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.mainColor
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
          //body
          HomePageBody()
        ],
      )
    );
  }
}
