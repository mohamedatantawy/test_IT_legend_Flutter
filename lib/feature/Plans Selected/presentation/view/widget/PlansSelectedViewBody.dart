import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_test/feature/Plans%20Selected/presentation/manager/cubit/detail_card_cubit.dart';
import 'package:it_test/feature/Plans%20Selected/presentation/view/widget/ContactWithSupport.dart';
import 'package:it_test/feature/Plans%20Selected/presentation/view/widget/CustomCard.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/customElevatedbutton.dart';

class PlansSelectedViewBody extends StatelessWidget {
  const PlansSelectedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCardCubit, DetailCardState>(
      builder: (context, state) {
        if (state is DetailCardSuccess) {
          print('this is sucess ${state.detailCards.length}');
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Column(
                    children: List.generate(
                      state.detailCards.length,
                      (index) =>
                          CustomCard(detailcardmodel: state.detailCards[index]),
                    ),
                  ),

                  const ContactWithSupport(),
                  const SizedBox(height: 200),
                  const customElevatedButton(
                    title: 'التالى',
                    icon: Icons.arrow_forward,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        } else if (state is DetailCardLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('there was an Error'));
        }
      },
    );
  }
}
