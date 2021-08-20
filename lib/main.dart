import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eWallet',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView(
          children: [
            // Current Budget status section
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffde6161),
                    Color(0xff2657eb),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Total Balance",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Rs. 4800.0",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BalanceItem(
                        itemName: "Income",
                        amount: "2500",
                        iconData: Icons.arrow_upward,
                        iconColor: Colors.green,
                      ),
                      BalanceItem(
                        itemName: "Expense",
                        amount: "2500",
                        iconData: Icons.arrow_downward,
                        iconColor: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BalanceItem extends StatelessWidget {
  const BalanceItem({
    Key? key,
    required this.itemName,
    required this.amount,
    this.iconData,
    this.iconColor,
  }) : super(key: key);

  final String itemName;
  final String amount;
  final IconData? iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.6),
          child: Icon(iconData, color: iconColor),
        ),
        SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12),
            ),
            Text(amount, style: TextStyle(color: Colors.white))
          ],
        ),
      ],
    );
  }
}
