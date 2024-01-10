// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String? balanace;
  final int membershipNo;
  final String? name;
  final String? imgUrl;

  const MyCard({
    Key? key,
    required this.balanace,
    required this.membershipNo,
    required this.name,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Text(
              'Balance',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              balanace! + ' LKR',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Card number
                Container(
                    padding: EdgeInsets.all(4),
                    child: CircleAvatar(
                      backgroundColor: Colors.purple,
                      backgroundImage: NetworkImage(imgUrl!),
                      radius: 25,
                    )),
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  name!,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //Expiry date
                Text(
                  '10/24',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
