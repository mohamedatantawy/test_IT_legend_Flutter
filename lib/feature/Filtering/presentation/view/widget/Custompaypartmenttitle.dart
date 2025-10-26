

import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class Custompaypartmenttitle extends StatelessWidget {
  const Custompaypartmenttitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text(
       title,// "الأقساط الشهرية",
        style: Textstyles.font16medinm.copyWith(
          color: kblackcolor.withOpacity(0.5),
        ),
      ),
    );
  }
}
