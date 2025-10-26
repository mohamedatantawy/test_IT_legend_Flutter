
import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';

class RowOFItemGrid extends StatelessWidget {
  const RowOFItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Stack(
          children: [
            Positioned(
              child: Image.asset(
                'asset/icons/ic_round-corporate-fare.png',
                height: 26,
                width: 26,
              ),
            ),
            const Positioned(
              child: Icon(
                Icons.check_circle_rounded,
                color: kbluecolor,
                size: 12,
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 24,
            width: 32,
            decoration: BoxDecoration(
              border: Border.all(color: kblackcolor.withOpacity(0.1)),
            ),
            child: const Icon(Icons.add_shopping_cart, size: 16),
          ),
        ),
        const SizedBox(width: 12),

        Image.asset(
          'asset/icons/9d49f354-c245-4cac-9644-3d3ef4bf62b8_removalai_preview 1.png',
          height: 22,
          width: 15,
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
