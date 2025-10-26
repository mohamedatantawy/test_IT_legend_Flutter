import 'package:flutter/material.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';
import 'package:it_test/feature/AllProducts/presentation/view/AllproductView.dart';
import 'package:it_test/feature/Home/presentation/view/widget/HomeViewBody.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget getBody() {
      switch (_selectedIndex) {
        case 4:
          return const Allproductview();
        case 0:
          return const Homeviewbody();
        default:
          return const Homeviewbody(); 
      }
    }

    return Scaffold(
      backgroundColor: kcolorwhite,
      body: getBody(),
      bottomNavigationBar:_selectedIndex!=4? Container(
        decoration: BoxDecoration(
          border: Border.all(color: kprimarycolor.withOpacity(0.5)),
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    (index == 0
                            ? Icons.home_outlined
                            : index == 1
                            ? Icons.chat
                            : index == 2
                            ? Icons.add_box_outlined
                            : index == 3
                            ? Icons.dataset
                            : Icons.person)
                        as IconData?, // Change this icon based on index
                    color: index == 2
                        ? kbluecolor
                        : _selectedIndex == index
                        ? kprimarycolor
                        : kprimarycolor.withOpacity(0.5),
                  ),
                  Text(
                    index == 0
                        ? 'الرئيسية'
                        : index == 1
                        ? 'محادثة'
                        : index == 2
                        ? 'أضف أعلان'
                        : index == 3
                        ? 'أعلاناتى'
                        : 'حسابى',
                    style: Textstyles.font12medium.copyWith(
                      color: index == 2
                          ? kbluecolor
                          : _selectedIndex == index
                          ? kprimarycolor
                          : kprimarycolor.withOpacity(0.5),
                    ),
                  ),
                  if (_selectedIndex == index) // Underline for selected item
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kprimarycolor, // Underline color
                      ),
                      margin: const EdgeInsets.only(top: 4.0),
                      height: 1,
                      width: 45.0, // Adjust width as needed
                    ),
                ],
              ),
            );
          }),
        ),
        //   child: BottomNavigationBar(
        //     currentIndex: _selectedIndex,
        //     onTap: _onItemTapped,
        //     selectedLabelStyle: Textstyles.font12medium,
        //     unselectedLabelStyle: Textstyles.font12medium,
        //     selectedItemColor: kprimarycolor,
        //     unselectedItemColor: kprimarycolor.withOpacity(0.5),
        //     showUnselectedLabels: true,

        //     items: [
        //       const BottomNavigationBarItem(
        //         label: 'حسابى',

        //         icon: Icon(Icons.person),
        //       ),
        //       const BottomNavigationBarItem(
        //         label: 'أعلاناتى',
        //         icon: Icon(Icons.person),
        //       ),
        //       const BottomNavigationBarItem(
        //         label: 'أضف أعلان',
        //         icon: Icon(Icons.person),
        //       ),
        //       const BottomNavigationBarItem(
        //         label: 'محادثة',
        //         icon: Icon(Icons.person),
        //       ),
        //       const BottomNavigationBarItem(
        //         label: 'الرئيسية',
        //         icon: Icon(Icons.person),
        //       ),
        //     ],
        //   ),
      ):null,
    );
  }
}
