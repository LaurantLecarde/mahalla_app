import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalla_app/mahalla_app/constant/colors.dart';

import '../../../widgets/leading_icon.dart';

class InChargeScreen extends StatelessWidget {
  const InChargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      body: _inChargeSection(context),
    );
  }

  _inChargeSection(context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(60),
          _appBar(context),
          const Gap(15),
          _inChargeMan(),
          const Gap(40),
          _workSchedule(),
          const Gap(30),
          _mahallaTime()
        ],
      ),
    );
  }

  _appBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leadingIcon(context),
        Text("  Malumot",
            style: GoogleFonts.nunitoSans(
                fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  _inChargeMan() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                // color: Colors.white
                color: Colors.grey.shade300)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/img/man.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Masul hodim ismi",
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                const Gap(8),
                Container(
                    width: 200,
                    height: 1,
                    color: Colors.grey.shade300,
                    child: null),
                const Gap(8),
                Text("Xodim lavozimi",
                    style: GoogleFonts.nunitoSans(color: Colors.grey)),
                const Gap(8),
                Text("+998 97 977 97 77",
                    style: GoogleFonts.nunitoSans(color: Colors.grey))
              ],
            ),
          )
        ],
      ),
    );
  }

  _workSchedule() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ish tartibi",
            style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.bold, fontSize: 18)),
        const Gap(10),
        Text("Dushanbadan - Shanbagacha",
            style: GoogleFonts.nunitoSans(color: Colors.grey)),
        const Gap(10),
        Text("7:30 dan - 16:30 gacha",
            style: GoogleFonts.nunitoSans(color: Colors.grey)),
      ],
    );
  }

  _mahallaTime(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mahallaga kelish vaqti",style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold,fontSize: 18)),
        const Gap(10),
        _infoRow()
       ],
    );
  }

  _infoRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _column("Kasbi", "Jinsi", "Raqami", "Ish tartibi"),
        const Gap(10),
        _column(":", ":", ":", ":"),
        const Gap(10),
        _column("Haydovchi", "Erkak", "+9998 97 97 77", "Muhammad Aliboy ...."),
      ],
    );
  }

  _column(String row1,String row2,String row3,String row4){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(row1,style: GoogleFonts.nunitoSans(color: Colors.grey)),
        const Gap(10),
        Text(row2,style: GoogleFonts.nunitoSans(color: Colors.grey)),
        const Gap(10),
        Text(row3,style: GoogleFonts.nunitoSans(color: Colors.grey)),
        const Gap(10),
        Wrap(children: [Text(row4,style: GoogleFonts.nunitoSans(color: Colors.grey),maxLines: 10),]),
      ],
    );
  }
}
