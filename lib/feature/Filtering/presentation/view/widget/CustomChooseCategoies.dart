import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';
import 'package:it_test/feature/Filtering/data/models/filteringmodel.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/CustomButtonCategoies.dart';

class Customchoosecategoies extends StatefulWidget {
  const Customchoosecategoies({super.key, required this.datamodels});
  final Filteringmodel datamodels;
  @override
  State<Customchoosecategoies> createState() => _CustomchoosecategoiesState();
}

class _CustomchoosecategoiesState extends State<Customchoosecategoies> {
  int isactive = 0;
  // Filteringmodel datamodels
  //  = Filteringmodel(
  //   kindName: ["توين هاوس", "توين هاوس", "توين هاوس", "توين هاوس", "توين هاوس"],
  // );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        children: List.generate(
         widget. datamodels.kindName.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                isactive = index + 1;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 12, bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: BoxBorder.all(
                  width: isactive == index + 1 ? 2 : 1,
                  color: isactive == index + 1
                      ? kbluecolor
                      : kblackcolor.withOpacity(0.1),
                ),
              ),
              child: Text(
                  widget.datamodels.kindName[index],
                style: Textstyles.font14mediumopacity50.copyWith(
                  color: isactive == index + 1
                      ? kbluecolor
                      : kprimarycolor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),

        // GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       isactive = 2;
        //     });
        //   },
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(30),
        //       border: BoxBorder.all(
        //         width: isactive == 2 ? 2 : 1,
        //         color: isactive == 2
        //             ? kbluecolor
        //             : kblackcolor.withOpacity(0.1),
        //       ),
        //     ),
        //     child: Text(
        //       "kfjgkdg",
        //       style: Textstyles.font14mediumopacity50.copyWith(
        //         color: isactive == 2
        //             ? kbluecolor
        //             : kprimarycolor.withOpacity(0.5),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
