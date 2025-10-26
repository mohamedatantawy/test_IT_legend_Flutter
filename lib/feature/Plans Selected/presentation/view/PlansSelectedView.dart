import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';
import 'package:it_test/feature/Plans%20Selected/presentation/view/widget/PlansSelectedViewBody.dart';
import 'package:it_test/feature/Home/presentation/view/HomeView.dart';

class PlansSelectedView extends StatelessWidget {
  const PlansSelectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(context),
      body: const PlansSelectedViewBody(),
    );
  }

  AppBar _AppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      leadingWidth: 0,
      leading: const SizedBox(),

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Homeview()),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 24,
                  color: kprimarycolor,
                ),
              ),
              Text("أختر الباقات اللى تناسبك", style: Textstyles.font24medium),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك",
              style: Textstyles.font14mediumopacity50,
            ),
          ),
        ],
      ),
    );
  }
}
