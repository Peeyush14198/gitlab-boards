// ignore_for_file: prefer_const_constructors

import 'package:dragndrop/providers/home.provider.dart';
import 'package:dragndrop/utils/navigation.dart';
import 'package:provider/provider.dart';
import 'package:dragndrop/utils/validator.dart';
import 'package:flutter/material.dart';

class AddTicketToBoard extends StatefulWidget {
  final int boardNo;
  const AddTicketToBoard({Key? key, required this.boardNo}) : super(key: key);

  @override
  _AddTicketToBoardState createState() => _AddTicketToBoardState();
}

class _AddTicketToBoardState extends State<AddTicketToBoard> {
  TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Add Ticket',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
          ),
          Form(
            key: formKey,
            child: TextFormField(
              controller: titleController,
              validator: Validator.validateEmptyField,
              decoration: InputDecoration(
                  label: const Text('Please enter title',
                      style: TextStyle(color: Colors.grey))),
            ),
          ),
          Container(
            height: 100,
          ),
          Center(
            child: InkWell(
              onTap: () {
                addTicket();
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Add ticket',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void addTicket() {
    if (!formKey.currentState!.validate()) return;

    context
        .read<HomeProvider>()
        .addTicketToBoard(widget.boardNo, titleController.text);
    Navigation.pop(context);
  }
}
