import 'package:flutter/material.dart';
import 'package:music_app/models/models.dart';
import 'package:music_app/models/track.dart';
import 'package:music_app/utils/helpers.dart';
import 'package:sizer/sizer.dart';

class BookmarkCardWidget extends StatelessWidget {
  final Track? track;
  final VoidCallback onTap;

  const BookmarkCardWidget(this.track, {Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Material(
        // colorScheme() just to reduce repeated code
        color: colorScheme(context).primaryContainer,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              track?.trackName ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: colorScheme(context).onPrimaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
