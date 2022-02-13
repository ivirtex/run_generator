import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    required this.text,
    required this.controller,
    this.onPressed,
    this.isPicker = false,
  });

  final String text;
  final TextEditingController controller;
  final VoidCallback? onPressed;
  final bool? isPicker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "wpisz cos no";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: text,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          IconButton(
              onPressed: onPressed,
              icon: isPicker! ? Icon(Icons.settings) : Icon(Icons.casino))
        ],
      ),
    );
  }
}
