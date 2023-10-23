import 'package:flutter/material.dart';

class AayaTextFromField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? prefix;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final int? maxLength;
  final FocusNode? focusNode;

  const AayaTextFromField({
    super.key,
    required this.size,
    required this.hintText,
    required this.controller,
    this.prefix,
    this.onChanged,
    required this.inputType,
    this.maxLength, this.focusNode,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size.width * 0.8,
        height: 55.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                prefix != null
                    ? const Text(
                        '+91 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      )
                    : const SizedBox(),
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    keyboardType: inputType,
                    onChanged: onChanged,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
