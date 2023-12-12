import 'dart:convert';

import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  TextFormFieldComponent(
      {Key? key,
      required this.label,
     required this.controller,
      this.suffixIconButton,
      this.function,
      this.onTap})
      : super(key: key);
  final String label;
  final IconData? suffixIconButton;
  final void Function()? function;
  final void Function()? onTap;
  TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: function,
            child: Icon(suffixIconButton),
          ),
          label: Text('$label'),
          labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            //borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.indigo),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
