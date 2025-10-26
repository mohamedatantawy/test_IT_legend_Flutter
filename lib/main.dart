import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_test/feature/Plans%20Selected/presentation/manager/cubit/detail_card_cubit.dart';
import 'package:it_test/feature/Filtering/data/models/filteringmodel.dart';
import 'package:it_test/feature/Filtering/presentation/manager/cubit/filtercubit_cubit.dart';
import 'package:it_test/feature/Home/presentation/manager/cubit/product_cubit.dart';
import 'package:it_test/feature/Home/presentation/view/HomeView.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FiltercubitCubit()..insertFiltering(),
        ),
        BlocProvider(create: (context) => ProductCubit()..initializeProducts()),
        BlocProvider(
          create: (context) => DetailCardCubit()..initializeData(),
        ),
      ],

      child: const MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('ar')],

        debugShowCheckedModeBanner: false,
        home: Homeview(),
      ),
    );
  }
}
