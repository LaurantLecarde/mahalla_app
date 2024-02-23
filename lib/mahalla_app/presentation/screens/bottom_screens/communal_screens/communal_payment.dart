import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalla_app/mahalla_app/constant/colors.dart';
import 'package:mahalla_app/mahalla_app/constant/navigations.dart';
import 'package:mahalla_app/mahalla_app/presentation/screens/bottom_screens/communal_screens/detailed_communal.dart';

class CommunalPayment extends StatefulWidget {
  const CommunalPayment({super.key});

  @override
  State<CommunalPayment> createState() => _CommunalPaymentState();
}

class _CommunalPaymentState extends State<CommunalPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      body: _communalPaymentSection(),
    );
  }

  _communalPaymentSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(70),
          _appBar(),
          const Gap(20),
          _communalPaymentType()
        ],
      ),
    );
  }

  _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Kamunal To'lovlar",
            style: GoogleFonts.nunitoSans(
                fontSize: 24, fontWeight: FontWeight.bold)),
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search))
      ],
    );
  }

  _communalPaymentType() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _paymentTypeBuilder(
            const Icon(Icons.water_drop_outlined,
                size: 30, color: Color(0xff016df1)),
            "Ichimlik suvi"),
        _paymentTypeBuilder(
            const Icon(Icons.electric_bolt, size: 30, color: Color(0xfffdb700)),
            "Elektr Energiya"),
        _paymentTypeBuilder(
            const Icon(Icons.local_fire_department_outlined,
                size: 30, color: Color(0xff00d931)),
            "GAZ"),
        _paymentTypeBuilder(
            const Icon(Icons.fire_truck_outlined,
                size: 30, color: Color(0xff1bce7d)),
            "Musor mashina"),
      ],
    );
  }

  _paymentTypeBuilder(Icon icon, String payment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: SizedBox(
        height: 80,
        child: Card(
          clipBehavior: Clip.hardEdge,
          borderOnForeground: true,
          surfaceTintColor: Colors.grey.shade400,
          child: InkWell(
            onTap: () =>
                navigatePush(context, DetailedCommunal(paymentType: payment)),
            child: Center(
              child: ListTile(
                leading: icon,
                title: Text(payment,
                    style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold)),
                titleAlignment: ListTileTitleAlignment.center,
                trailing: Icon(
                  CupertinoIcons.forward,
                  color: AppColors.appColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
