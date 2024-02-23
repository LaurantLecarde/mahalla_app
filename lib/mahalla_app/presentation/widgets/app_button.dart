import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalla_app/mahalla_app/constant/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key,
  required this.onTap,
    required this.childText,
    required this.color,
    required this.borderColor,
    required this.textColor
  });


 final VoidCallback onTap;
  final Color color;
  final String childText;
  final Color borderColor;
  final Color textColor;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            color: borderColor
          )
        )
      ),
      child: Text(childText,style: GoogleFonts.nunitoSans(fontSize: 16,color: textColor,fontWeight: FontWeight.bold)),
    );
  }
}
