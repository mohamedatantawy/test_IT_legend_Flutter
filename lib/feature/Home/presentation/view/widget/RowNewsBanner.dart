
import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';

class RowNewsBanner extends StatelessWidget {
  const RowNewsBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check, size: 24, color: kgreencolor),
        const SizedBox(width: 4),
        Text(
          'شحن مجانى',
          style: Textstyles.font12regular.copyWith(color: kgreencolor),
        ),
        const Spacer(),
        Text('لأى عرض تطلبه دلوقتى !', style: Textstyles.font10regular),
      ],
    );
  }
}

