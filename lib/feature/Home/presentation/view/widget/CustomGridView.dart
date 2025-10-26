import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_test/feature/Home/presentation/manager/cubit/product_cubit.dart';
import 'package:it_test/feature/Home/presentation/view/widget/CustomgridViewItim.dart';

class Customgridview extends StatelessWidget {
  const Customgridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return SliverGrid.builder(
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              childAspectRatio: 0.48,
              // mainAxisExtent: 0.4,
            ),
            itemBuilder: (context, index) =>
                Customgridviewitim(products: state.products[index]),
          );
        } else if (state is ProductLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: Text("there was an error")),
          );
        }
      },
    );
  }
}
