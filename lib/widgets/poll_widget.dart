import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/controllers/poll_controller.dart';
import 'package:go_poll/models/poll.dart';
import 'package:go_poll/styles/buttons.dart';
import 'package:go_poll/styles/colors.dart';
import 'package:go_poll/widgets/choice_widget.dart';

class PollWidget extends GetView<PollController> {
  const PollWidget({Key? key, required this.poll}) : super(key: key);
  final Poll poll;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(color: lightGrey, blurRadius: 10, offset: Offset(0, 1))
          ], borderRadius: BorderRadius.circular(10), color: grey),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.restart();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListView(children: [
                  Text(
                    poll.title.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Puff",
                        color: white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      poll.description.capitalizeFirst.toString(),
                      style: const TextStyle(fontSize: 20, color: white,fontFamily: "Puff",),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Make a choice:",
                      style: TextStyle(fontSize: 15, color: white,fontFamily: "Puff",)),
                  const SizedBox(height: 20),
                  ...poll.options
                      .map((e) => ChoiceWidget(
                          option: e.capitalizeFirst.toString(),
                          index: poll.options.indexOf(e)))
                      .toList(),
                  const SizedBox(height: 30),
                  Obx(
                    () {
                      final selected = controller.isSelected.value != -1;
                      return ElevatedButton.icon(
                        onPressed: poll.voted
                            ? null
                            : () {
                                if (selected) {
                                  controller.addVote(
                                      poll.id, controller.isSelected.value);
                                }
                              },
                        style: indigoButton,
                        icon: const Icon(Icons.where_to_vote_outlined),
                        label: Text(poll.voted ? "Voted" : "Vote",
                            style: const TextStyle(color: white,fontFamily: "Puff",)),
                      );
                    },
                  ),
                ]),
              ),
            ),
          )),
    );
  }
}
