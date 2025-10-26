import 'package:flutter/widgets.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class Subtiltecard extends StatelessWidget {
  const Subtiltecard({super.key, required this.icons, required this.title});
  final IconData icons;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icons),
        Text(
          title, //  'صلاحية الأعلان 30 يوم',
          style: Textstyles.font14mediumopacity50.copyWith(
            color: kprimarycolor,
          ),
        ),
      ],
    );
  }
}
