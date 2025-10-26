import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:it_test/feature/Plans%20Selected/data/SqliteFile/sqliteDetailscard.dart';
import 'package:it_test/feature/Plans%20Selected/data/models/detailCardmodel.dart';
import 'package:it_test/feature/Plans%20Selected/data/models/titleCardmodel.dart';
import 'package:meta/meta.dart';

part 'detail_card_state.dart';

class DetailCardCubit extends Cubit<DetailCardState> {
  DetailCardCubit() : super(DetailCardInitial());
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  List<Detailcardmodel> newDetailCard = [
    Detailcardmodel(
      name: 'أساسية',
      num_view: 0, // Example view count
      titlecardmodel: [
        Titlecardmodel(
          icon: Icons.share_arrival_time_outlined,
          title: 'صلاحية الأعلان 30 يوم',
          subtitle: null,
        ),
      ],
    ),
    Detailcardmodel(
      name: 'أكسترا',
      num_view: 7, // Example view count
      titlecardmodel: [
        Titlecardmodel(
          icon: Icons.share_arrival_time_outlined,
          title: 'صلاحية الأعلان 30 يوم',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.rocket_outlined,
          title: 'رفع لأعلى القائمة كل 3 أيام',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.push_pin_outlined,
          title: 'تثبيت فى مقاول صحى',
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
      ],
    ),
    Detailcardmodel(
      name: 'بلس',
      num_view: 18, // Example view count
      titlecardmodel: [
        Titlecardmodel(
          icon: Icons.share_arrival_time_outlined,
          title: 'صلاحية الأعلان 30 يوم',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.rocket_outlined,
          title: 'رفع لأعلى القائمة كل 3 أيام',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.push_pin_outlined,
          title: 'تثبيت فى مقاول صحى',
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
        Titlecardmodel(
          icon: Icons.public,
          title: 'ظهور فى كل محافظات مصر',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.workspace_premium,
          title: 'أعلان مميز',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.push_pin_outlined,
          title: 'تثبيت فى مقاول صحى فى الجهراء',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.push_pin_outlined,
          title:" تثبيت فى مقاول صحى",
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
      ],
    ),
    Detailcardmodel(
      name: 'سوبر',
      num_view: 24, // Example view count
      titlecardmodel: [
        Titlecardmodel(
          icon: Icons.share_arrival_time_outlined,
          title: 'صلاحية الأعلان 30 يوم',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.rocket_outlined,
          title: 'رفع لأعلى القائمة كل 3 أيام',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.push_pin_outlined,
          title: 'تثبيت فى مقاول صحى',
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
        Titlecardmodel(
          icon: Icons.public,
          title: 'ظهور فى كل محافظات مصر',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.workspace_premium,
          title: 'أعلان مميز',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.push_pin_outlined,
          title: 'تثبيت فى مقاول صحى فى الجهراء',
          subtitle: null,
        ),
        Titlecardmodel(
          icon: Icons.push_pin_outlined,
          title: 'تثبيت فى مقاول صحى',
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
      ],
    ),
  ];
  Future<void> initializeData() async {
    try {
      emit(DetailCardLoading());
      await DatabaseHelper.instance.deleteDatabase();

      // Check if data already exists
      final existing = await _databaseHelper.getDetailCards();

      if (existing.isEmpty) {
        // Insert initial data
        for (var element in newDetailCard) {
          await _databaseHelper.insertDetailCard(element);
        }
        print("Inserted ${newDetailCard.length} detail cards");
      } else {
        print("Data already exists, loading from database");
      }

      // Fetch and emit the data
      await fetchAllDetailCards();
    } catch (e) {
      emit(DetailCardFailure(errormessage: e.toString()));
      print("Initialization failure: $e");
    }
  }

  // Insert a single detail card
  Future<void> insertDetailCard(Detailcardmodel detailCard) async {
    try {
      emit(DetailCardLoading());

      await _databaseHelper.insertDetailCard(detailCard);
      print("Inserted detail card: ${detailCard.name}");

      await fetchAllDetailCards();
    } catch (e) {
      emit(DetailCardFailure(errormessage: e.toString()));
      print("Insert failure: $e");
    }
  }

  // Fetch all detail cards
  Future<void> fetchAllDetailCards() async {
    try {
      final List<Detailcardmodel> detailCards = await _databaseHelper
          .getDetailCards();

      print("Fetched ${detailCards.length} detail cards:");
      for (var card in detailCards) {
        print(
          "  ${card.name}: ${card.num_view} views with ${card.titlecardmodel.length} features",
        );
      }

      emit(DetailCardSuccess(detailCards: detailCards));
    } catch (e) {
      emit(DetailCardFailure(errormessage: e.toString()));
      print("Fetch failure: $e");
    }
  }
}
