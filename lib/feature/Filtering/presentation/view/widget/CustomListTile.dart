import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.Subtile,
    required this.icon,
    required this.traling,
  });
  final String title;
  final String Subtile;
  final Widget icon;
  final Widget traling;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title, // "عقارات",
        style: Textstyles.font14mediumopacity50.copyWith(color: kprimarycolor),
      ),
      subtitle: Text(
        Subtile, //   "فلل البيع",
        style: Textstyles.font12regular.copyWith(
          color: kblackcolor.withOpacity(0.5),
        ),
      ),
      leading: icon, // const Icon(Icons.import_contacts),
      trailing: traling,
      //
      // TextButton(
      //   onPressed: () {},
      //   child: Text(
      //     "تغيير",
      //     style: Textstyles.font14mediumopacity50.copyWith(
      //       color: kbluecolor,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    );
  }
}
