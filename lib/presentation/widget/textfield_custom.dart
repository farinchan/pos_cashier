// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final String errorText;
  final bool isPassword;
  TextEditingController? controller = TextEditingController();
  TextFieldCustom(
      {super.key,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.errorText = "",
      this.controller,
      this.isPassword = false});

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? obsecure : false,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.red)),
              filled: true,
              errorText: widget.errorText == "" || widget.errorText == "[]"
                  ? null
                  : widget.errorText,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obsecure = !obsecure;
                        });
                      },
                      icon: obsecure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility))
                  : widget.suffixIcon,
              hoverColor: const Color(0xffF7F7F7),
              fillColor: const Color(0xffF7F7F7),
              hintText: widget.hintText,
            ),
          ),
        ),
      ],
    );
  }
}
