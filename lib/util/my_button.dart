// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

test() {
  // ignore: avoid_print
  print("Hello");
}

class MyButton extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;

  const MyButton({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: test(),
      child: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                //color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 30,
                    spreadRadius: 10,
                  )
                ]),
            child: Center(
              child: Image.asset(iconImagePath),
            ),
          ),
          //Text
          SizedBox(
            height: 4,
          ),
          Text(
            buttonText,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
