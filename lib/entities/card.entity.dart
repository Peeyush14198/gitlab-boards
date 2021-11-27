import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final String uid;
  final String title;
  final DateTime dateTime;
  bool isDragging;

  CardEntity(
      {required this.uid,
      required this.dateTime,
      required this.title,
      required this.isDragging});

  @override
  List<Object?> get props => [
        uid,
      ];
}
