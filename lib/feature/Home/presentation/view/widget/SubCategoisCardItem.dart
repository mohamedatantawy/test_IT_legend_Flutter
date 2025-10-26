import 'package:flutter/material.dart';
import 'package:it_test/core/utils/textstyles.dart';
import 'package:it_test/feature/Home/data/models/subcategoiesmodels.dart';

class Subcategoiscarditem extends StatelessWidget {
  const Subcategoiscarditem({super.key, required this.subcategoiesmodels});
  final Subcategoiesmodels subcategoiesmodels;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(subcategoiesmodels.image),
          ),
          Text(subcategoiesmodels.title, style: Textstyles.font12regular),
        ],
      ),
    );
  }
}
