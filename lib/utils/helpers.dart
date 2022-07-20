import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget spacer({double? width, double? height}) {
  return SizedBox(height: height, width: width);
}

ColorScheme colorScheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}
