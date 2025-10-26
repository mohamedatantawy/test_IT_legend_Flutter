import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/feature/Home/presentation/view/widget/RowNewsBanner.dart';

class Customnewsbanner extends StatelessWidget {
  const Customnewsbanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: korangecolor.withOpacity(0.05),

        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const RowNewsBanner(),
    );
  }
}
