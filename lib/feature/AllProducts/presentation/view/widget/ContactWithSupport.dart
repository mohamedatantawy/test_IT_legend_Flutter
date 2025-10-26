import 'package:flutter/widgets.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class ContactWithSupport extends StatelessWidget {
  const ContactWithSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kblackcolor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "باقات مخصصة لك",
            style: Textstyles.font14mediumopacity50.copyWith(
              color: kprimarycolor,
            ),
          ),
          Text(
            'تواصل معنا لأختيار الباقة المناسبة لك',
            style: Textstyles.font12regular,
          ),
          Text(
            'فريق المبيعات',
            style: Textstyles.font16bold.copyWith(color: kbluecolor),
          ),
        ],
      ),
    );
  }
}
