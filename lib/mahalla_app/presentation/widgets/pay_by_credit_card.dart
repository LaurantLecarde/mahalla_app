import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalla_app/mahalla_app/constant/navigations.dart';
import 'package:mahalla_app/mahalla_app/presentation/widgets/text_field.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';

import '../../constant/colors.dart';
import 'app_button.dart';



TextEditingController _name = TextEditingController();
TextEditingController _cardNumber = TextEditingController();
TextEditingController _useDate = TextEditingController();
TextEditingController _cvv = TextEditingController();

final _maskNumber = MaskInputFormatter(mask: "#### #### #### ####");
final _maskDate = MaskInputFormatter(mask: "##/##");
final _maskCvv = MaskInputFormatter(mask: "####");

bool _visible = true;
showMyBottomSheet(context,VoidCallback onPres) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => navigatePop(context),
                  icon:
                  Icon(CupertinoIcons.xmark, color: AppColors.appColor)),
              Text("Yangi karta qo'shing",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              _nameTextFld(),
              const Gap(10),
              AppTextField(
                labelText: "Karta raqami",
                controller: _cardNumber,
                maskInputFormatter: _maskNumber,
                obscure: false,
                textNumber: true,
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.creditcard),
                ),
              ),
              const Gap(10),
              SizedBox(
                height: 70,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 170,
                      child: AppTextField(
                        labelText: "Amal qilish muddati",
                        controller: _useDate,
                        maskInputFormatter: _maskDate,
                        obscure: false,
                        textNumber: true,
                        iconButton: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.calendar_today),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: AppTextField(
                        labelText: "CVV",
                        controller: _cvv,
                        maskInputFormatter: _maskCvv,
                        obscure: true,
                        textNumber: true,
                        iconButton: IconButton(
                          onPressed: onPres,
                          icon: _visible
                              ? const Icon(CupertinoIcons.eye_slash)
                              : const Icon(CupertinoIcons.eye),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: AppButton(
                    onTap: () => navigatePop(context),
                    childText: "Kartani qo'shish",
                    color: AppColors.appColor,
                    borderColor: AppColors.appColor,
                    textColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );

}

_nameTextFld(){
  return TextField(
    controller: _name,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      suffixIcon: const Icon(CupertinoIcons.person),
      suffixIconColor: Colors.grey,
      labelText: "Last Name",
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
