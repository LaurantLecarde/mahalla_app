import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.maskInputFormatter,
      required this.obscure,
        required this.textNumber,
        required this.iconButton
      });

  final String labelText;
  final TextEditingController controller;
  final MaskInputFormatter maskInputFormatter;
  final bool obscure;
  final bool textNumber;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textNumber ? TextInputType.number : TextInputType.text,
      obscureText: obscure,
      inputFormatters: [maskInputFormatter],
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: iconButton,
        suffixIconColor: Colors.grey,
        labelText: labelText,
        labelStyle: GoogleFonts.nunitoSans(color: Colors.grey),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
