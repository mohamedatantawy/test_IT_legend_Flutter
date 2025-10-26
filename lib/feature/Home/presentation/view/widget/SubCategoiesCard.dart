import 'package:flutter/material.dart';
import 'package:it_test/feature/Home/data/models/subcategoiesmodels.dart';
import 'package:it_test/feature/Home/presentation/view/widget/SubCategoisCardItem.dart';

class Subcategoiescard extends StatelessWidget {
  Subcategoiescard({super.key});
  final List<Subcategoiesmodels> sub = [
    Subcategoiesmodels(
      title: 'موضة رجالى',
      image: "asset/image/Photo Container.png",
    ),
    Subcategoiesmodels(
      title: 'ساعات',
      image: "asset/image/Photo Containe0r.png",
    ),
    Subcategoiesmodels(
      title: 'موبايلات',
      image: "asset/image/Photo Container2.png",
    ),
    Subcategoiesmodels(
      title: 'منتجات تجميل',
      image: "asset/image/Photo Container.png",
    ),
    Subcategoiesmodels(
      title: 'موضة رجالى',
      image: "asset/image/Photo Container.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sub.length,
        itemBuilder: (context, index) =>
            Subcategoiscarditem(subcategoiesmodels: sub[index]),
      ),
    );
  }
}
