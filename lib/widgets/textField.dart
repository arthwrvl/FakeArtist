import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final int type;
  final VoidCallback onEdit;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.onEdit,
      required this.type});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:
          widget.type == 1 ? TextInputType.name : TextInputType.number,
      cursorColor: const Color(0xAA000000),
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 4, 8, 4),
        filled: true,
        fillColor: Color(0xFFE8F1D7),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.zero),
            borderSide: BorderSide(color: Colors.black, width: 3)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.zero),
            borderSide: BorderSide(color: Colors.black, width: 2)),
      ),
      controller: widget.controller,
      onChanged: (value) => {widget.onEdit()},
    );
  }
}
