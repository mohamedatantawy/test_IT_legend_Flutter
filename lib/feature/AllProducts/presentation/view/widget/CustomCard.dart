import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/feature/AllProducts/data/models/detailCardmodel.dart';
import 'package:it_test/feature/AllProducts/presentation/view/widget/CustomDetailFromCard.dart';
import 'package:it_test/feature/AllProducts/presentation/view/widget/customTitleCard.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.detailcardmodel});
  final Detailcardmodel detailcardmodel;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: BoxBorder.all(color: kblackcolor.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Customtitlecard(
            price: '3,000ج.م',
            title: detailcardmodel.name,
          ),
          Divider(
            color: kblackcolor.withOpacity(0.1),
            endIndent: 16,
            indent: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomDetailFromCard(detailcardmodel: detailcardmodel),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
