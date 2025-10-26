import 'package:flutter/material.dart';
import 'package:it_test/feature/Home/presentation/view/widget/CustomCategoiesItems.dart';

class Customcategoies extends StatefulWidget {
  const Customcategoies({super.key});

  @override
  State<Customcategoies> createState() => _CustomcategoiesState();
}

class _CustomcategoiesState extends State<Customcategoies> {
  final List<String> categoies = const [
    'كل العروض',
    'ملابس',
    'أكسسوارات',
    'الكترونيات',
  ];
  int isactives = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoies.length,
        itemBuilder: (context, index) => CustomCategoiesItems(
          namecategres: categoies[index],
        isactive: isactives == index, // Pass active state
          onTap: () {
            setState(() {
              isactives = index; // Update selected index
            });
          },
        ),
      ),
    );
  }
}
