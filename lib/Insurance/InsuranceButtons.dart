import 'package:flutter/material.dart';

Widget insurancebuttons(
    String imgurl, String name, String info, double height) {
  return Container(
    height: height * 0.12,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            imgurl,
            height: 120,
            width: 80,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(info),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
