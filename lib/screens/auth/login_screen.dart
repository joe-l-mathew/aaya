import 'package:aaya/screens/auth/widgets/circle_widget.dart';
import 'package:aaya/screens/widgets/aaya_button_widget.dart';
import 'package:aaya/screens/widgets/aaya_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  bool isValidated = false;
  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleWidget(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: const Text(
                "Welcome to Aaya",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AayaTextFromField(
              maxLength: 10,
                inputType: TextInputType.phone,
                size: size,
                hintText: "97XXXXXX88",
                controller: phoneNumberController,
                onChanged: (val) {
                  if (val.isEmpty) {
                    isValidated = false;
                  }
                  if (val.length == 10) {
                    isValidated = true;
                  } else {
                    isValidated = false;
                  }
                  setState(() {});
                },
                prefix: '+91'),
            const SizedBox(
              height: 20,
            ),
            AayaButtonWidget(
              size: size,
              isValidated: isValidated,
              ontap: () {
                print(phoneNumberController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
