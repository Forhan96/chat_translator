import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool modal;
  final FocusNode? focusNode;
  final int? characterLength;
  final Widget? prefix;
  TextInputField({
    required this.controller,
    required this.label,
    this.modal = false,
    this.focusNode,
    this.characterLength,
    required this.prefix,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        enabled: !widget.modal,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(color: Colors.grey[800]),
        labelText: widget.label,
        contentPadding: const EdgeInsets.all(18.0),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(
            color: Color(0xffE2E8F0),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(
            color: Color(0xffE2E8F0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(
            color: Color(0xffE2E8F0),
          ),
        ),
        prefixIcon: widget.prefix,
      ),
    );
  }
}
