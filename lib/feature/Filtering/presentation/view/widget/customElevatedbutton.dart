import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class customElevatedButton extends StatelessWidget {
  const customElevatedButton({super.key, required this.title, this.icon});
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.widthOf(context) * 0.8,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            backgroundColor: kbluecolor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title, // "شاهد 10,000+ نتائج",
                style: Textstyles.font16bold.copyWith(color: kcolorwhite),
              ),
              icon != null
                  ? Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(icon, color: kcolorwhite, size: 24),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
