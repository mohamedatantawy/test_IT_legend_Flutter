import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class TitleofGriditem extends StatelessWidget {
  const TitleofGriditem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          // Use Expanded to allow flexibility in text size
          child: Text(
            title, // 'جاكيت من الصوف مناسب',
            style: Textstyles.font14mediumopacity50.copyWith(
              color: kprimarycolor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Image.asset('asset/icons/Vector.png'),
        const SizedBox(width: 8),
      ],
    );
  }
}
