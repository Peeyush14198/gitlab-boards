// ignore_for_file: avoid_unnecessary_containers

import 'package:dragndrop/entities/card.entity.dart';
import 'package:dragndrop/providers/home.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayCard extends StatelessWidget {
  final int indexOfCard;
  final int boardNo;
  final CardEntity cardEntity;
  const DisplayCard(
      {Key? key,
      required this.cardEntity,
      required this.indexOfCard,
      required this.boardNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget(onWillAccept: (data) {
      return true;
    }, onAccept: (data) {
      // print(indexOfCard);
      // print(data);
      context
          .read<HomeProvider>()
          .horizontalDragMaterial(indexOfCard, boardNo, data as CardEntity);
    }, builder: (context, _, rd) {
      return Draggable(
        data: cardEntity,
        childWhenDragging: _cardWhenDragging(context),
        child: _cardWidget(context),
        feedback: _cardWhenDragging(context),
      );
    });
  }

  Widget _cardWhenDragging(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.8,
        height: 200,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Center(
          child: Text(cardEntity.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
        ),
      ),
    );
  }

  Widget _cardWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.8,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(cardEntity.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14))),
                IconButton(
                    onPressed: () {
                      context
                          .read<HomeProvider>()
                          .removeTickeFromBoard(boardNo, cardEntity);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red))
              ],
            ),
            Container(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
            ),
            Container(
              height: 10,
            ),
            Text(
              cardEntity.dateTime.toLocal().toString(),
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
