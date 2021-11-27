import 'package:dragndrop/entities/card.entity.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:uuid/uuid.dart';

class HomeProvider extends ChangeNotifier {
  List<CardEntity> board1 = [
    CardEntity(
        uid: const Uuid().v1(),
        dateTime: DateTime.now(),
        title: randomString(10),
        isDragging: false),
    CardEntity(
        uid: const Uuid().v1(),
        dateTime: DateTime.now(),
        title: randomString(10),
        isDragging: false),
    CardEntity(
        uid: const Uuid().v1(),
        dateTime: DateTime.now(),
        title: randomString(10),
        isDragging: false)
  ];
  List<CardEntity> board2 = [
    CardEntity(
        uid: const Uuid().v1(),
        dateTime: DateTime.now(),
        title: randomString(10),
        isDragging: false),
    CardEntity(
        uid: const Uuid().v1(),
        dateTime: DateTime.now(),
        title: randomString(10),
        isDragging: false),
    CardEntity(
        uid: const Uuid().v1(),
        dateTime: DateTime.now(),
        title: randomString(10),
        isDragging: false)
  ];
  List<CardEntity> board3 = [
    CardEntity(
        uid: const Uuid().v1(),
        dateTime: DateTime.now(),
        title: randomString(10),
        isDragging: false),
    CardEntity(
        uid: const Uuid().v1(),
        dateTime: DateTime.now(),
        title: randomString(10),
        isDragging: false),
    CardEntity(
        uid: const Uuid().v1(),
        dateTime: DateTime.now(),
        title: randomString(10),
        isDragging: false)
  ];

  void refreshListners() {
    notifyListeners();
  }

  void dragStarted(int indexOfCard, int boardNo) {
    if (boardNo == 1) {
      board1[indexOfCard].isDragging = true;
    } else if (boardNo == 2) {
      board2[indexOfCard].isDragging = true;
    } else {
      board3[indexOfCard].isDragging = true;
    }
    notifyListeners();
  }

  void dragEnded(int indexOfCard, int boardNo) {
    if (boardNo == 1) {
      board1[indexOfCard].isDragging = false;
    } else if (boardNo == 2) {
      board2[indexOfCard].isDragging = false;
    } else {
      board3[indexOfCard].isDragging = false;
    }
    notifyListeners();
  }

  void verticalDragMaterial(int boardNo, CardEntity entity) {
    print('This is called');
    if (boardNo == 1) {
      if (!board1.contains(entity)) {
        board1.add(entity);
        board2.remove(entity);
        board3.remove(entity);
      }
    } else if (boardNo == 2) {
      if (!board2.contains(entity)) {
        board2.add(entity);
        board1.remove(entity);
        board3.remove(entity);
      }
    } else {
      if (!board3.contains(entity)) {
        board3.add(entity);
        board2.remove(entity);
        board1.remove(entity);
      }
    }

    notifyListeners();
  }

  void horizontalDragMaterial(
      int newIndex, int boardNo, CardEntity cardEntity) {
    if (boardNo == 1) {
      board1.remove(cardEntity);
      board1.insert(newIndex, cardEntity);
    } else if (boardNo == 2) {
      board2.remove(cardEntity);
      board2.insert(newIndex, cardEntity);
    } else {
      board3.remove(cardEntity);
      board3.insert(newIndex, cardEntity);
    }
    notifyListeners();
  }

  void addTicketToBoard(int boardNo, String title) {
    CardEntity cardEntity = CardEntity(
        uid: Uuid().v1(),
        dateTime: DateTime.now(),
        title: title,
        isDragging: false);

    if (boardNo == 1) {
      board1.add(cardEntity);
    } else if (boardNo == 2) {
      board2.add(cardEntity);
    } else {
      board3.add(cardEntity);
    }

    notifyListeners();
  }

  void removeTickeFromBoard(int boardNo, CardEntity cardEntity) {
    if (boardNo == 1) {
      board1.remove(cardEntity);
    } else if (boardNo == 2) {
      board2.remove(cardEntity);
    } else {
      board3.remove(cardEntity);
    }

    notifyListeners();
  }
}
