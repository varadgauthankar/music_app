import 'package:flutter/material.dart';
import 'package:music_app/models/models.dart';
import 'package:music_app/utils/helpers.dart';
import 'package:sizer/sizer.dart';

class TrackCard extends StatelessWidget {
  final Track? track;
  final VoidCallback onTap;

  const TrackCard(this.track, {Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Material(
        // colorScheme() just to reduce repeated code
        color: colorScheme(context).primaryContainer,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  track?.trackName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: colorScheme(context).onPrimaryContainer,
                  ),
                ),
                spacer(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.album_outlined),
                    spacer(width: 6.0),
                    Flexible(
                      child: Text(
                        track?.albumName ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                spacer(height: 2.0),
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    spacer(width: 6.0),
                    Flexible(
                      child: Text(
                        track?.artistName ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
