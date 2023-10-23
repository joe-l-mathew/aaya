import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [SizedBox()],
      )),
    );
  }
}
