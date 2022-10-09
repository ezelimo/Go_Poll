import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/controllers/poll_controller.dart';
import 'package:go_poll/styles/colors.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final pollController = Get.find<PollController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              autofocus: true,
              focusNode: FocusNode(),
              controller: controller,
              style: const TextStyle(color: lightWhite,fontFamily: "Puff"),
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGrey,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: lightGrey),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: indigo)),
                hintText: "Option",
                hintStyle: const TextStyle(color: lightWhite,fontFamily: "Puff"),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                pollController.options.remove(controller);
              },
              icon: const Icon(
                Icons.delete_outlined,
                color: white,
              ))
        ],
      ),
    );
  }
}
