// ignore_for_file: sized_box_for_whitespace

import 'package:dragndrop/providers/home.provider.dart';
import 'package:dragndrop/screens/board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Scrollbar(
                controller: _scrollController,
                key: Key(const Uuid().v1()),
                isAlwaysShown: true,
                child: Consumer<HomeProvider>(
                    builder: (context, homeProvider, child) {
                  return ListView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    children: _buildBoards(context),
                  );
                })),
          ),
        ));
  }

  List<Widget> _buildBoards(BuildContext context) {
    return List.generate(3, (index) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: index == 0
              ? Board(
                  boardNo: index + 1,
                  boardList: context.read<HomeProvider>().board1,
                  scrollController: ScrollController(),
                )
              : index == 1
                  ? Board(
                      boardNo: index + 1,
                      boardList: context.read<HomeProvider>().board2,
                      scrollController: ScrollController(),
                    )
                  : Board(
                      boardNo: index + 1,
                      boardList: context.read<HomeProvider>().board3,
                      scrollController: ScrollController(),
                    ));
    }).toList();
  }
}
