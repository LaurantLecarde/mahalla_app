


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../constant/colors.dart';
import '../../constant/navigations.dart';
import 'app_button.dart';

showSuccessDialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Column(
                children: [
                  Lottie.asset("assets/anim/success.json",
                      width: 300, height: 300),
                  const Gap(30),
                  Text("Muvaffaqiyatli!",
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.bold,
                          color: AppColors.appColor,
                          fontSize: 25)),
                  const Gap(15),
                  Center(
                    child: Text(
                        "To'lovingiz muvaffaqiyatli amalga oshirildi!",
                        style: GoogleFonts.nunitoSans()),
                  ),
                  const Gap(15),
                  Center(
                    child: SizedBox(
                      height: 60,
                      width: 400,
                      child: AppButton(
                        onTap: () => navigatePop(context),
                        childText: "OK",
                        color: AppColors.appColor,
                        borderColor: AppColors.appColor,
                        textColor: Colors.white,),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      });
}

showUnSuccessDialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Column(
                children: [
                  Lottie.asset("assets/anim/error.json",
                      width: 300, height: 300),
                  const Gap(30),
                  Text("Oops, Xatolik!",
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 25)),
                  const Gap(15),
                  Center(
                    child: Text(
                        "Amaliyot amalga oshmadi. Iltimis, internet aloqangizni tekshiring va qaytadan uruning!",
                        style: GoogleFonts.nunitoSans()),
                  ),
                  const Gap(15),
                  Center(
                    child: SizedBox(
                      height: 60,
                      width: 350,
                      child: AppButton(
                        onTap: () {
                          showSuccessDialog(context);
                          // navigatePop(context);
                        },
                        childText: "Qayta Urunish",
                        color: AppColors.appColor,
                        borderColor: AppColors.appColor,
                        textColor: Colors.white,),
                    ),
                  ),
                  const Gap(10),
                  Center(
                    child: SizedBox(
                      height: 60,
                      width: 350,
                      child: AppButton(
                        onTap: () => navigatePop(context),
                        childText: "Bekor qilish",
                        color:Color(0xffe8eefd),
                        borderColor: Color(0xffe8eefd),
                        textColor: AppColors.appColor,),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      });
}