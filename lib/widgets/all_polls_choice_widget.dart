import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/controllers/poll_controller.dart';
import 'package:go_poll/styles/colors.dart';

class AllPollsChoiceWidget extends GetView<PollController> {
  const AllPollsChoiceWidget({Key? key, required this.option, required this.index}) : super(key: key);
  final String option;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: grey, blurRadius: 2, offset: Offset(2, 3))],
          color: darkBlue,
            border: Border.all(width: 0.5, color: darkBlue),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            option,
            style: const TextStyle(color: white,fontFamily: "Puff"),
          ),
        ),
      ),
    );
  }
}
