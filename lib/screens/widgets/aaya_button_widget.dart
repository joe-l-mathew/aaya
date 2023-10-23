import 'package:flutter/material.dart';

class AayaButtonWidget extends StatelessWidget {
  const AayaButtonWidget({
    super.key,
    required this.size,
    required this.isValidated,
  });

  final Size size;
  final bool isValidated;
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size.width * 0.8,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: !isValidated
                ? Theme.of(context).unselectedWidgetColor
                : Colors.black),
        child: Center(
            child: Text(
          "Continue",
          style: TextStyle(
              color: isValidated
                  ? Theme.of(context).unselectedWidgetColor
                  : Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16),
        )),
      ),
    );
  }
}
