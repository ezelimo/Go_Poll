import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_poll/screens/all_polls.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  AllPolls(),
    ),
  );
}
