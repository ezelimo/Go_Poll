import 'package:flutter/material.dart';
import 'package:go_poll/styles/colors.dart';

final ButtonStyle button = TextButton.styleFrom(
  primary: white,
  textStyle: const TextStyle(color: white),
  backgroundColor: lightGrey,
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
final ButtonStyle indigoButton = TextButton.styleFrom(
  primary: white,
  textStyle: const TextStyle(color: white),
  backgroundColor: indigo,
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
