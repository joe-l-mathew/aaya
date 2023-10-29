import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 10,
                ),
                Text("Pera 91,Kakkanad"),
                Icon(Icons.keyboard_arrow_down_rounded),
                Spacer(),
                Icon(Icons.notifications_none),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.message_outlined),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
