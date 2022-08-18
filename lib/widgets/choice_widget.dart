import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/controllers/poll_controller.dart';
import 'package:go_poll/styles/colors.dart';

class ChoiceWidget extends GetView<PollController> {
  const ChoiceWidget({Key? key, required this.option, required this.index}) : super(key: key);
  final String option;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          controller.isSelected.value =index;   
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: controller.isSelected.value==index? indigo: Colors.transparent,
              border: Border.all(width: 0.75, color: indigo),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              option,
              style: const TextStyle(color: white,fontFamily: "Puff"),
            ),
          ),
        ),
      ),
    ));
  }
}
