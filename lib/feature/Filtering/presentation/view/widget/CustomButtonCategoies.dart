import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class CustomButtonCategoies extends StatefulWidget {
  const CustomButtonCategoies({super.key});

  @override
  State<CustomButtonCategoies> createState() => _CustomButtonCategoiesState();
}

class _CustomButtonCategoiesState extends State<CustomButtonCategoies> {
  bool isactive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isactive = !isactive;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: BoxBorder.all(color: kblackcolor.withOpacity(0.1)),
        ),
        child: Text(
          "kfjgkdg",
          style: Textstyles.font14mediumopacity50.copyWith(
            color: isactive ? kbluecolor : kprimarycolor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
