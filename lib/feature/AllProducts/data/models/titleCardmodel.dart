import 'package:flutter/widgets.dart';

class Titlecardmodel {
  final int? id;
  final IconData icon;
  final String title;
  final String? subtitle;
  final int? detailCardId;

  Titlecardmodel({
    this.id,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.detailCardId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'icon_code': icon.codePoint,
      'title': title,
      'subtitle': subtitle,
      'detail_card_id': detailCardId,
    };
  }

  factory Titlecardmodel.fromMap(Map<String, dynamic> map) {
    return Titlecardmodel(
      id: map['id'],
      icon: IconData(map['icon_code'], fontFamily: 'MaterialIcons'), // Reconstruct IconData
      title: map['title'],
      subtitle: map['subtitle'],
      detailCardId: map['detail_card_id'],
    );
  }
}