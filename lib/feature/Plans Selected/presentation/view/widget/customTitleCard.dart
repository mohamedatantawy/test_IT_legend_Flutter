import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class Customtitlecard extends StatefulWidget {
  const Customtitlecard({super.key, required this.title, required this.price});

  final String title;
  final String price;

  @override
  State<Customtitlecard> createState() => _CustomtitlecardState();
}

class _CustomtitlecardState extends State<Customtitlecard> {
  bool values = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: kbluecolor,
          value: values,
          onChanged: (value) {
            setState(() {
              values = value ?? false;
            });
          },
        ),
        Text(
          widget.title,
          style: Textstyles.font16bold.copyWith(
            color: values ? kbluecolor : kprimarycolor,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            widget.price,
            style: Textstyles.font16bold.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: korangecolor,
              //  decorationStyle: TextDecorationStyle.double,
              decorationThickness: 30,

              color: korangecolor,
            ),
          ),
        ),
      ],
    );
  }
}
