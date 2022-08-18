import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/controllers/poll_controller.dart';
import 'package:go_poll/screens/create_poll_page.dart';
import 'package:go_poll/screens/poll_page.dart';
import 'package:go_poll/screens/results_page.dart';
import 'package:go_poll/styles/colors.dart';

class AllPolls extends StatelessWidget {
  const AllPolls({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PollController());
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        shadowColor: lightWhite,
        title: const Text(
          "GoPoll",
          style: TextStyle(fontFamily: "Puff"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextButton.icon(
              onPressed: () => Get.to(const CreatePollPage()),
              icon: const Icon(
                Icons.poll_outlined,
                color: white,
              ),
              label: const Text(
                "Add Poll",
                style: TextStyle(color: white, fontFamily: "Puff"),
              ),
            ),
          ),
        ],
        backgroundColor: darkBlue,
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.polls.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await controller.restart();
                    },
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.65,
                      children: controller.polls
                          .map(
                            (poll) => Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      poll.voted
                                          ? Get.to(ResultsPage(poll: poll))
                                          : Get.to(PollPage(poll: poll));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: poll.voted
                                                    ? indigo
                                                    : lightGrey,
                                                blurRadius: 10,
                                                offset: const Offset(0, 1))
                                          ],
                                          color:
                                              poll.voted ? indigo : lightGrey,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30, horizontal: 20.0),
                                        child: ListView(
                                          children: [
                                            Text(
                                              textAlign: TextAlign.center,
                                              poll.title.toUpperCase(),
                                              style: const TextStyle(
                                                  color: white,
                                                  fontFamily: "Puff",
                                                  fontSize: 15),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              textAlign: TextAlign.center,
                                              poll.description.capitalizeFirst!,
                                              style: const TextStyle(
                                                  color: lightWhite,
                                                  fontFamily: "Puff"),
                                            ),
                                            /*...poll.options
                                                .map((e) =>
                                                    AllPollsChoiceWidget(
                                                        option: e
                                                            .capitalizeFirst
                                                            .toString(),
                                                        index: poll.options
                                                            .indexOf(e)))
                                                .toList(),*/
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                )
              : const Center(
                  child: Text("Empty",
                      style: TextStyle(color: white, fontFamily: "Puff")))),
    );
  }
}
