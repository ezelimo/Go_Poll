import 'package:flutter/material.dart';
import 'package:go_poll/styles/colors.dart';

class Testt extends StatelessWidget {
  const Testt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: white,
    );
  }
}

class Testtt extends StatelessWidget {
  const Testtt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      title: const Text("edadf"),
    );
  }
}
