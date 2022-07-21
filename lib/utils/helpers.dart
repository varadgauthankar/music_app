import 'package:flutter/material.dart';

Widget spacer({double? width, double? height}) {
  return SizedBox(height: height, width: width);
}

ColorScheme colorScheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}
