import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/controllers/poll_controller.dart';
import 'package:go_poll/models/poll.dart';
import 'package:go_poll/styles/buttons.dart';
import 'package:go_poll/styles/colors.dart';
import 'package:go_poll/widgets/pie_chart.dart';

class ResultsPage extends GetView<PollController> {
  const ResultsPage({Key? key, required this.poll}) : super(key: key);
  final Poll poll;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        shadowColor: white,
        title: const Text(
          "Results",
          style: TextStyle(fontFamily: "Puff"),
        ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: lightGrey,
                                  blurRadius: 10,
                                  offset: Offset(0, 1))
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: grey),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                            top: 50, right: 30, left: 30, bottom: 30),
                        child: ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: [
                            Text(
                              poll.title.capitalizeFirst!,
                              style: const TextStyle(
                                  color: white,
                                  fontFamily: "Puff",
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              poll.description.capitalizeFirst!,
                              style: const TextStyle(
                                  color: lightWhite,
                                  fontFamily: "Puff",
                                  fontSize: 15),
                            ),
                            const SizedBox(height: 50),
                            PieChartWidget(poll: poll),
                            /*const SizedBox(height: 100),
                            ElevatedButton.icon(
                              onPressed: () {
                                Get.off(const CreatePollPage());
                              },
                              style: indigoButton,
                              icon: const Icon(Icons.poll_outlined),
                              label: const Text(
                                "Create a New Poll",
                                style: TextStyle(color: white,fontFamily: "Puff"),
                              ),
                            ),*/

                            const Divider(
                              thickness: 0.5,
                              color: indigo,
                              height: 100,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Get.snackbar("-,-", ":(", colorText: white);
                              },
                              style: indigoButton,
                              icon: const Icon(Icons.share),
                              label: const Text(
                                "Share",
                                style:
                                    TextStyle(color: white, fontFamily: "Puff"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              : const Center(
                  child: Text("Empty", style: TextStyle(color: white)))),
    );
  }
}
