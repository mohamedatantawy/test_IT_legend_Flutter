import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/CustomTextField.dart';

class CustomEnterMoney extends StatelessWidget {
  const CustomEnterMoney({super.key, this.label1, this.label2});
  final String? label1;
  final String? label2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(child: CustomTextfield(label: label1)),
            const SizedBox(width: 12),
            Expanded(child: CustomTextfield(label: label2)),
          ],
        ),
      ),
    );
  }
}
