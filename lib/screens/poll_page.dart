import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/controllers/poll_controller.dart';
import 'package:go_poll/models/poll.dart';
import 'package:go_poll/styles/colors.dart';
import 'package:go_poll/widgets/poll_widget.dart';

class PollPage extends GetView<PollController> {
  const PollPage({Key? key, required this.poll}) : super(key: key);
  final Poll poll;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.isSelected.value = -1;
        return true;
      },
      child: Scaffold(
        backgroundColor: darkBlue,
        appBar: AppBar(
          shadowColor: white,
          title: const Text("GoPoll", style: TextStyle(fontFamily: "Puff")),
          actions: [
            TextButton.icon(
                onPressed: () {
                  Get.back();
                  controller.isSelected.value = -1;
                },
                icon: const Icon(
                  Icons.poll_outlined,
                  color: white,
                ),
                label: const Text(
                  "See All Polls",
                  style: TextStyle(
                    color: white,
                  ),
                ))
          ],
          backgroundColor: darkBlue,
        ),
        body: PollWidget(poll: poll),
      ),
    );
  }
}
