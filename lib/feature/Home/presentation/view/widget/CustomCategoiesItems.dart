import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class CustomCategoiesItems extends StatefulWidget {
  const CustomCategoiesItems({
    super.key,
    required this.namecategres,
    this.onTap,
    required this.isactive,
  });
  final String namecategres;
  final void Function()? onTap;
  final bool isactive;

  @override
  State<CustomCategoiesItems> createState() => _CustomCategoiesItemsState();
}

class _CustomCategoiesItemsState extends State<CustomCategoiesItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 41,
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: widget.isactive ? korangecolor.withOpacity(0.05) : null,
          borderRadius: BorderRadius.circular(4),
          border: BoxBorder.all(color: kblackcolor.withOpacity(0.1)),
        ),
        child: Text(
          widget.namecategres,
          style: Textstyles.font14mediumopacity50.copyWith(
            color: widget.isactive ? kredcolor : kblackcolor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
