import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalla_app/mahalla_app/constant/colors.dart';
import 'package:mahalla_app/mahalla_app/presentation/widgets/leading_icon.dart';

class DetailedCommunal extends StatefulWidget {
  const DetailedCommunal({super.key, required this.paymentType});

  final paymentType;

  @override
  State<DetailedCommunal> createState() => _DetailedCommunalState();
}

class _DetailedCommunalState extends State<DetailedCommunal> {
  TextStyle _style = GoogleFonts.nunitoSans(color: Colors.grey, fontSize: 15);
  TextStyle _blackStyle =
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
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.info)),
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
            Text("Karta",style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold,fontSize: 20)),
            InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add,color: AppColors.appColor),
                  Text("Yangi karta qo'shish",style: GoogleFonts.nunitoSans(color: AppColors.appColor,fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  _lastPaidData(){
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
              _infoBuilder("F.I.SH", "BO****"),
              _infoBuilder("Manzil", "***, Uy:14, KV*"),
              _infoBuilder("Abanent hisob raqami", "3404-1230074"),
              _infoBuilder("Joriy oyda hisoblagan KV", "148.02"),
            ],
          ),
        ),
      ),
    );
  }

  _infoBuilder(String appData, String userData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(appData, style: _style),
          Text(userData, style: _blackStyle),
        ],
      ),
    );
  }
}
