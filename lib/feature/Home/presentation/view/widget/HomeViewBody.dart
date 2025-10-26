import 'package:flutter/material.dart';
import 'package:it_test/feature/Home/presentation/view/widget/CustomAppBar.dart';
import 'package:it_test/feature/Home/presentation/view/widget/CustomCategeies.dart';
import 'package:it_test/feature/Home/presentation/view/widget/CustomGridView.dart';
import 'package:it_test/feature/Home/presentation/view/widget/CustomNewsBanner.dart';
import 'package:it_test/feature/Home/presentation/view/widget/SubCategoiesCard.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 45)),
          const SliverToBoxAdapter(child: Customappbar()),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          const SliverToBoxAdapter(child: Customcategoies()),
          const SliverToBoxAdapter(child: SizedBox(height: 33)),
          SliverToBoxAdapter(child: Subcategoiescard()),
          const SliverToBoxAdapter(child: SizedBox(height: 33)),
          const SliverToBoxAdapter(child: Customnewsbanner()),
        //  SliverToBoxAdapter(child: SizedBox(height: 20)),
          const Customgridview(),
        ],
      ),
    );
  }
}
