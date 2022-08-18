import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/controllers/poll_controller.dart';
import 'package:go_poll/styles/buttons.dart';
import 'package:go_poll/styles/colors.dart';
import 'package:go_poll/widgets/options_widget.dart';

class CreatePollPage extends StatelessWidget {
  const CreatePollPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PollController());
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        shadowColor: white,
        title: const Text(
          "GoPoll",
          style: TextStyle(fontFamily: "Puff"),
        ),
        backgroundColor: darkBlue,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(color: lightGrey, blurRadius: 10, offset: Offset(0, 1))
            ], borderRadius: BorderRadius.circular(10), color: grey),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Create a Poll",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white,
                      fontSize: 45,
                      fontFamily: "Puff",
                    ),
                  ),
                ),
                TextField(
                  style: const TextStyle(color: lightWhite, fontFamily: "Puff"),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: lightGrey,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: lightGrey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: indigo)),
                    hintText: "Title",
                    hintStyle:
                        const TextStyle(color: lightWhite, fontFamily: "Puff"),
                  ),
                  controller: controller.titleController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextField(
                    style:
                        const TextStyle(color: lightWhite, fontFamily: "Puff"),
                    maxLines: null,
                    minLines: 2,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: lightGrey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: lightGrey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: indigo)),
                      hintText: "Description",
                      hintStyle: const TextStyle(
                        color: lightWhite,
                        fontFamily: "Puff",
                      ),
                    ),
                    controller: controller.descriptionController,
                  ),
                ),
                ...controller.options.map(
                  (element) => OptionWidget(controller: element),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: button,
                    onPressed: () {
                      // Get.bottomSheet(Testt());
                      // Get.dialog(Testtt());
                      controller.addOptionWidget();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text(
                      "Add Option",
                      style: TextStyle(fontFamily: "Puff"),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: indigo,
                  height: 100,
                ),
                ElevatedButton.icon(
                  onPressed: controller.addPoll,
                  style: indigoButton,
                  icon: const Icon(Icons.poll_outlined),
                  label: const Text(
                    "Create Poll",
                    style: TextStyle(color: white, fontFamily: "Puff"),
                  ),
                ),
                const SizedBox(height: 20,),
                /*ElevatedButton.icon(
                  onPressed:()=> Get.off(const AllPolls()),
                  style: button,
                  icon: const Icon(Icons.close_sharp),
                  label: const Text(
                    "Cancel",
                    style: TextStyle(color: white, fontFamily: "Puff"),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
