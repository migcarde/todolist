import 'package:equatable/equatable.dart';

class ItemBusiness extends Equatable {
  late final int id;
  late final String text;
  late final bool isChecked;

  ItemBusiness({required this.id, required this.text, required this.isChecked});

  factory ItemBusiness.fromJson(Map<String, dynamic> json) => ItemBusiness(
      id: json['id'], text: json['text'], isChecked: json['isChecked']);

  @override
  List<Object?> get props => [id, text, isChecked];
}
