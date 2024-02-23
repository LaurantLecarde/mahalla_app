import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mahalla_app/mahalla_app/constant/colors.dart';
import 'package:mahalla_app/mahalla_app/constant/navigations.dart';
import 'package:mahalla_app/mahalla_app/presentation/widgets/app_button.dart';
import 'package:mahalla_app/mahalla_app/presentation/widgets/leading_icon.dart';

import '../../../widgets/pay_by_credit_card.dart';
import '../../../widgets/success_error_dialog.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key, required this.paymentType});

  final paymentType;

  @override
  State<PayPage> createState() => _DetailedCommunalState();
}

class _DetailedCommunalState extends State<PayPage> {
  final TextStyle _style =
      GoogleFonts.nunitoSans(color: Colors.grey, fontSize: 15);

  final TextStyle _blackStyle =
      GoogleFonts.nunitoSans(color: Colors.black, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      body: _getDetailPay(),
    );
  }

  _getDetailPay() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [const Gap(60), _appBar(context), _paymentSection()],
      ),
    );
  }

  _appBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leadingIcon(context),
            Text("  Kamunal To'lovlar",
                style: GoogleFonts.nunitoSans(
                    fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  _paymentSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(20),
        Text(
          "${widget.paymentType} uchun to'lov",
          style:
              GoogleFonts.nunitoSans(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Gap(20),
        _lastPaidData(),
        const Gap(50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Karta",
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.bold, fontSize: 20)),
            InkWell(
              onTap: () {
                showMyBottomSheet(context, () {
                  setState(() {});
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: AppColors.appColor),
                  Text("Yangi karta qo'shish",
                      style: GoogleFonts.nunitoSans(
                          color: AppColors.appColor,
                          fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
        _buildCarusel()
      ],
    );
  }

  _lastPaidData() {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 255,
        width: 330,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("umumiy balans", style: _style),
              Text("2.200.100 UZS",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold, fontSize: 30)),
              Text("oxirgi to'lov - 22.12.2023", style: _style),
              const Gap(10),
              const Divider(color: Color(0xffe8e8e8), height: 2),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _itemBuilder(CupertinoIcons.creditcard, "Deposit",
                      () => _showPayBottomSheet()),
                  _itemBuilder(
                      CupertinoIcons.money_dollar_circle, "Crypto", () {}),
                  _itemBuilder(Icons.wallet_outlined, "Transfer", () {}),
                  _itemBuilder(Icons.money_outlined, "Ernings", () {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _itemBuilder(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 75,
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: AppColors.appColor,
                  borderRadius: BorderRadius.circular(10000)),
              child: Center(
                  child: Icon(
                icon,
                color: Colors.white,
              )),
            ),
            Text(text,
                style: GoogleFonts.nunitoSans(
                    fontSize: 11, color: AppColors.appColor))
          ],
        ),
      ),
    );
  }

  _buildCarusel() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: CarouselSlider.builder(
        options: CarouselOptions(
            enableInfiniteScroll: false,
            height: 300,
            viewportFraction: 0.74,
            enlargeCenterPage: true),
        itemCount: 3,
        itemBuilder: (context, index, pageIndex) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/img/visa_card.png"));
        },
      ),
    );
  }

  final TextEditingController _pay = TextEditingController();

  _showPayBottomSheet() {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            width: double.infinity,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => navigatePop(context),
                      icon: Icon(CupertinoIcons.xmark,
                          color: AppColors.appColor)),
                  Text("${widget.paymentType} uchun to'lash",
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _pay,
                      decoration: InputDecoration(
                        labelText: "To'lov summasini kiriting",
                        labelStyle: GoogleFonts.nunitoSans(color: Colors.grey),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        disabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                      ),
                    ),
                  ),
                  const Gap(30),
                  Center(
                      child: SizedBox(
                    height: 60,
                    width: 200,
                    child: AppButton(
                        onTap: () => showUnSuccessDialog(context),
                        childText: "To'lash",
                        color: AppColors.appColor,
                        borderColor: AppColors.appColor,
                    textColor: Colors.white,),
                  ))
                ],
              ),
            ),
          );
        });
  }

}
