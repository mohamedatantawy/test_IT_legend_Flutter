import 'package:it_test/feature/Plans%20Selected/data/models/titleCardmodel.dart';

class Detailcardmodel {
  final int? id;
  final int num_view;
  final String name;
  final List<Titlecardmodel> titlecardmodel;

  Detailcardmodel({
    this.id,
    required this.name,
    required this.num_view,
    required this.titlecardmodel,
  });
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'num_view': num_view};
  }
}
