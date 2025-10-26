import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';
import 'package:it_test/feature/Filtering/presentation/view/FilteringView.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('أستكشف العروض', style: Textstyles.font16medinm),
        Row(
          children: [
            Text('الكل', style: Textstyles.font16boldblackopacity50),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilteringView(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward,
                size: 24,
                color: kblackcolor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
