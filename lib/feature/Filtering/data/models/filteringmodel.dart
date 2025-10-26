import 'dart:convert';

class Filteringmodel {
  final int? id;
  final List<String> kindName;
  final String? category; // Optional: to identify filter type

  Filteringmodel({
    this.id, 
    required this.kindName,
    this.category,
  });

  // Convert to Map - encode List<String> as JSON string
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kindName': jsonEncode(kindName),
      'category': category,
    };
  }

  // Create from Map - decode JSON string back to List<String>
  factory Filteringmodel.fromMap(Map<String, dynamic> map) {
    return Filteringmodel(
      id: map['id'] as int?,
      kindName: List<String>.from(jsonDecode(map['kindName'])),
      category: map['category'] as String?,
    );
  }

  @override
  String toString() => 'Filteringmodel(id: $id, category: $category, kindName: $kindName)';
}