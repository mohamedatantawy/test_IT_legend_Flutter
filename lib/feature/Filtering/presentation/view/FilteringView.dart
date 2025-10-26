import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/FilteringViewBody.dart';

class FilteringView extends StatelessWidget {
  const FilteringView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _AppBar(context), body:  FilteringViewBody());
  }

  AppBar _AppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.close_rounded, size: 24),
      ),
      title: Text("فلترة", style: Textstyles.font24medium),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "رجوع للأفتراضى",
            style: Textstyles.font16bold.copyWith(color: kbluecolor),
          ),
        ),
      ],
    );
  }
}
