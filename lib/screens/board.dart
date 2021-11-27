import 'package:dragndrop/entities/card.entity.dart';
import 'package:dragndrop/providers/home.provider.dart';
import 'package:dragndrop/screens/add.ticket.dart';
import 'package:dragndrop/screens/card.dart';
import 'package:dragndrop/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Board extends StatelessWidget {
  final int boardNo;
  final List<CardEntity> boardList;
  final ScrollController scrollController;
  const Board(
      {Key? key,
      required this.boardNo,
      required this.boardList,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: 300,
      child: DragTarget(onWillAccept: (data) {
        return true;
      }, onAcceptWithDetails: (data) {
        print('On accept with details $data');
      }, onAccept: (data) {
        print('This is the on accept $data');
        context
            .read<HomeProvider>()
            .verticalDragMaterial(boardNo, data as CardEntity);
      }, builder: (context, List<dynamic> cd, List<dynamic> rd) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Board no' " " '$boardNo',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigation.navigateToPage(
                            context,
                            AddTicketToBoard(boardNo: boardNo),
                            'AddTicketToBoard');
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ))
                ],
              ),
              Container(
                height: 20,
              ),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                child: Scrollbar(
                    controller: scrollController,
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(boardList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: DisplayCard(
                                cardEntity: boardList[index],
                                indexOfCard: index,
                                boardNo: boardNo),
                          );
                        }),
                      ),
                    )),
              ))
            ],
          ),
        );
      }),
    );
  }
}
