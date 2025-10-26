import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';
import 'package:it_test/feature/Home/data/models/productmodel.dart';
import 'package:it_test/feature/Home/presentation/view/widget/RowOfItemGrid.dart';
import 'package:it_test/feature/Home/presentation/view/widget/imageofGridItem.dart';
import 'package:it_test/feature/Home/presentation/view/widget/lineonthe%20text.dart';
import 'package:it_test/feature/Home/presentation/view/widget/titleofGriditem.dart';

class Customgridviewitim extends StatelessWidget {
  const Customgridviewitim({super.key, required this.products});
  final ProductModel products;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 365,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kblackcolor.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            ImageofGridItem(image: products.image),
            TitleofGriditem(title: products.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 8),
                Text(
                  (products.discount).toString(), //  '32,000,000',
                  style: Textstyles.font14mediumopacity50.copyWith(
                    color: korangecolor,
                  ),
                  maxLines: 1,
                ),
                Text(
                  'جم/',
                  style: Textstyles.font14mediumopacity50.copyWith(
                    color: korangecolor,
                  ),
                  maxLines: 1,
                ),
                Expanded(
                  child: DiscountText(
                    text: products.price.toString(), //'60,000,000',
                    fontSize: 12,
                    textColor: kblackcolor.withOpacity(0.5),
                    lineColor: kblackcolor.withOpacity(0.5),
                  ),
                ),

                const SizedBox(width: 3.5),
                const Icon(Icons.favorite_outline),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 8),
                Icon(
                  Icons.local_fire_department,
                  size: 12,
                  color: kblackcolor.withOpacity(0.5),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'تم بيع 3.3k+',
                    style: Textstyles.font10regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 27),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: RowOFItemGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
