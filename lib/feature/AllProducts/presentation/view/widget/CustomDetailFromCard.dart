import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';
import 'package:it_test/feature/AllProducts/data/models/detailCardmodel.dart';
import 'package:it_test/feature/AllProducts/data/models/titleCardmodel.dart';

class CustomDetailFromCard extends StatelessWidget {
  const CustomDetailFromCard({super.key, required this.detailcardmodel});
  final Detailcardmodel detailcardmodel;

  @override
  Widget build(BuildContext context) {
    print(detailcardmodel.titlecardmodel.length);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: List.generate(
                detailcardmodel.titlecardmodel.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SizedBox(
                    height:
                        detailcardmodel.titlecardmodel[index].subtitle != null
                        ? 34
                        : 24,
                    child: ListTile(
                      title: Text(
                        detailcardmodel.titlecardmodel[index].title,
                        style: Textstyles.font14mediumopacity50.copyWith(
                          color: kprimarycolor,
                        ),
                      ),
                      subtitle:
                          detailcardmodel.titlecardmodel[index].subtitle != null
                          ? Text(
                              detailcardmodel.titlecardmodel[index].subtitle!,
                              style: Textstyles.font14mediumopacity50.copyWith(
                                color: kredcolor,
                              ),
                            )
                          : null,
                      leading: Icon(detailcardmodel.titlecardmodel[index].icon),
                    ),
                  ),
                ),
              ),
            ),
          ),
          detailcardmodel.num_view != 0
              ? Expanded(
                  flex: 1,

                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 25,
                          top: 16,
                          bottom: 7,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                          border: const Border(
                            top: BorderSide(color: kgreencolor),
                            left: BorderSide(color: kgreencolor),
                            right: BorderSide(color: kgreencolor),
                          ),
                          color: kgreencolor.withOpacity(0.05),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(900),
                            topRight: Radius.circular(900),
                          ),
                        ),
                        child: Text(
                          detailcardmodel.num_view.toString(),
                          textAlign: TextAlign.center,
                          style: Textstyles.font14mediumopacity50.copyWith(
                            color: kgreencolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'ضعف عدد المشاهدات',
                        textAlign: TextAlign.center,
                        style: Textstyles.font12regular.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
