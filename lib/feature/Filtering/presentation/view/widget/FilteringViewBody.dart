import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_test/core/utils/constant.dart';
import 'package:it_test/core/utils/textstyles.dart';
import 'package:it_test/feature/Filtering/data/models/filteringmodel.dart';
import 'package:it_test/feature/Filtering/presentation/manager/cubit/filtercubit_cubit.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/CustomChooseCategoies.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/CustomEnterMoney.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/CustomListTile.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/CustomTextField.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/Custompaypartmenttitle.dart';
import 'package:it_test/feature/Filtering/presentation/view/widget/customElevatedbutton.dart';

class FilteringViewBody extends StatefulWidget {
  const FilteringViewBody({super.key});

  @override
  State<FilteringViewBody> createState() => _FilteringViewBodyState();
}

class _FilteringViewBodyState extends State<FilteringViewBody> {
  // final List<Filteringmodel> filterings = [

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<FiltercubitCubit>(context).fetchAllProducts();
    return SingleChildScrollView(
      child: BlocBuilder<FiltercubitCubit, FiltercubitState>(
        builder: (context, state) {
          if (state is FilteringSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Custompaypartmenttitle(title: "الفئة"),

                // Padding(
                //   padding: const EdgeInsets.only(right: 16),
                //   child: Text(
                //     "الفئة",
                //     style: Textstyles.font16medinm.copyWith(
                //       color: kblackcolor.withOpacity(0.5),
                //     ),
                //   ),
                // ),
                CustomListTile(
                  title: "عقارات",
                  Subtile: "فلل البيع",
                  icon: Image.asset('asset/icons/iconhand.png'),
                  traling: TextButton(
                    onPressed: () {},
                    child: Text(
                      "تغيير",
                      style: Textstyles.font14mediumopacity50.copyWith(
                        color: kbluecolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Divider(),
                CustomListTile(
                  title: "الموقع",
                  Subtile: "مصر",
                  icon: const Icon(
                    Icons.location_on_outlined,
                    color: kprimarycolor,
                  ),
                  traling: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      color: kprimarycolor,
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20),
                const Custompaypartmenttitle(title: "الأقساط الشهرية"),
                const CustomEnterMoney(),
                const SizedBox(height: 10),
                const Custompaypartmenttitle(title: "النوع"),

                Customchoosecategoies(datamodels: state.filterings.first),
                const SizedBox(height: 20),

                Custompaypartmenttitle(title: state.filterings[1].category!),
                Customchoosecategoies(datamodels: state.filterings[1]),
                const SizedBox(height: 20),

                const Custompaypartmenttitle(title: "السعر"),
                const CustomEnterMoney(label1: "أقل سعر", label2: "أقصى سعر"),
                const SizedBox(height: 20),
                Custompaypartmenttitle(title: state.filterings[2].category!),
                Customchoosecategoies(datamodels: state.filterings[2]),
                const SizedBox(height: 20),
                Custompaypartmenttitle(title: state.filterings[3].category!),
                Customchoosecategoies(datamodels: state.filterings[3]),
                const SizedBox(height: 78),
                const customElevatedButton( title:  "شاهد 10,000+ نتائج",),
                const SizedBox(height: 30),
              ],
            );
          } else if (state is FilteringLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
