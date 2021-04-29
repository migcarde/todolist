import 'package:equatable/equatable.dart';

class ItemResponse extends Equatable {
  late final int id;
  late final String text;
  late final bool isChecked;

  ItemResponse({required this.id, required this.text, required this.isChecked});

  factory ItemResponse.fromJson(Map<String, dynamic> json) => ItemResponse(
      id: json['id'], text: json['text'], isChecked: json['isChecked']);

  @override
  List<Object?> get props => [id, text, isChecked];
}
