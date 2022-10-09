import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/models/poll.dart';
import 'package:go_poll/screens/poll_page.dart';
import 'package:go_poll/screens/results_page.dart';
import 'package:go_poll/services/api.dart';

class PollController extends GetxController {
  final polls = <Poll>[].obs;

  final options = <TextEditingController>[].obs;
  final isBlank=false.obs;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final isLoading = true.obs;
  final isVoted = false.obs;

  late final isSelected = (-1).obs;

  final Map<String, double> dataMap = {};

  @override
  void onInit() {
    addOptionWidget();
    addOptionWidget();
    fetch();
    super.onInit();
  }

  Future<void> fetch() async {
    isLoading.value = true;
    final result = await Api.getAllPolls();
    if (result == null) {
      Get.snackbar("Error", "Couldn't get poll.");
    } else {
      polls.value = result;
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    for (final cont in options) {
      cont.dispose();
    }
    super.onClose();
  }

  Future<void> restart() async {
    await fetch();
  }

  void addPoll() async { 
    final createPoll = Poll(
      id: -1,
      title: titleController.text,
      description: descriptionController.text,
      voted: false,
      options: options.map((e) => e.text).toList(),
      votes: [],
    );
    for(final option in options){
      if(option.text==""){
        isBlank.value = true;
      }else{
        isBlank.value= false;
      }
    }
    if (titleController.text != "" &&
        descriptionController.text != "" &&
        options.length >= 2 && isBlank.value==false) {
      final poll = await Api.createPoll(createPoll);
      if (poll == null) {
        Get.snackbar("Error", "Poll couldn't be created!");
        return;
      }
      polls.insert(0, poll);
      Get.off(PollPage(poll: poll));
      titleController.clear();
      descriptionController.clear();
      for (final cont in options) {
        cont.dispose();
      }
      options.clear();
      options.add(TextEditingController());
      options.add(TextEditingController());
    } else {
      Get.snackbar("Blank Space",
          "You have to add at least two options and fill all the blank spaces!");
    }
    refresh();
  }

  void addOptionWidget() async {
    options.add(TextEditingController());
  }

  void addVote(int id, int index) async {
    final result = await Api.vote(id, index);
    if (result == null) {
      Get.snackbar("Error", "Couldn't get votes.");
    } else {
      polls[id].votes = result;
      isSelected.value = -1;
      polls[id].voted = true;
      Get.off(ResultsPage(poll: polls[id]));
    }
  }
}
