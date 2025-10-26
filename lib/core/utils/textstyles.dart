import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';

abstract class Textstyles {
  Textstyles._();
  static TextStyle font16medinm =const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: kprimarycolor,
    fontFamily: 'Tajawal',
  );
  static TextStyle font16boldblackopacity50 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: kblackcolor.withOpacity(0.5),
    fontFamily: 'Tajawal',
  );

  static TextStyle font14mediumopacity50 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
     color: kprimarycolor.withOpacity(0.5),
    fontFamily: 'Tajawal',
  );
  static TextStyle font12regular  =const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
     color: kprimarycolor,
      fontFamily: 'Tajawal',
  );
  static TextStyle font10regular  =const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
     color: kprimarycolor,
      fontFamily: 'Tajawal',
  );
 static TextStyle font24medium =const TextStyle(
    fontSize:24,
    fontWeight: FontWeight.w500,
     color: kprimarycolor,
    fontFamily: 'Tajawal',
  );
  static TextStyle font12medium =const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
     color: kprimarycolor,
    fontFamily: 'Tajawal',
  );
   static TextStyle font16bold =const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: kprimarycolor,
    fontFamily: 'Tajawal',
  );

}
