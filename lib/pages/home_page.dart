// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:dcs_wallet/pages/welcome_screen.dart';
import 'package:dcs_wallet/provider/auth_provider.dart';
import 'package:dcs_wallet/util/my_button.dart';
import 'package:dcs_wallet/util/my_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
                iconSize: 32,
                color: Colors.pink[200],
              ),
              IconButton(
                onPressed: () {
                  ap.userSignOut().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        ),
                      );
                },
                icon: Icon(Icons.exit_to_app),
                iconSize: 32,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(children: [
          //app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Text(
                    'My',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Cards',
                    style: TextStyle(fontSize: 28),
                  ),
                ]),
                //Plus Button
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.grey[400], shape: BoxShape.circle),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          //Cards
          Container(
            height: 200,
            child: PageView(
              children: [
                MyCard(
                  balanace: ap.userModel.balanace,
                  membershipNo: 12,
                  name: ap.userModel.name,
                  imgUrl: ap.userModel.profilePic,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //pay button
                MyButton(
                  iconImagePath: 'lib/icons/credit-card.png',
                  buttonText: 'Pay Now',
                ),
                MyButton(
                  iconImagePath: 'lib/icons/send-money.png',
                  buttonText: 'Send Money',
                ),
                MyButton(
                  iconImagePath: 'lib/icons/bill.png',
                  buttonText: 'History',
                ),
              ],
            ),
          ),

          SizedBox(height: 45),

          Flexible(
            child: Text(
              'Latest Transactions',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              child: DataTable(horizontalMargin: 0, columns: [
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Date',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Transaction',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Amount',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Balance',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('10/12')),
                  DataCell(Text('Funeral')),
                  DataCell(Text('500.00')),
                  DataCell(Text('2750.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('02/12')),
                  DataCell(Text('Monthly fee')),
                  DataCell(Text('250.00')),
                  DataCell(Text('2250.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('01/12')),
                  DataCell(Text('Opening Balance')),
                  DataCell(Text('2000.00')),
                  DataCell(Text('2000.00')),
                ]),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
