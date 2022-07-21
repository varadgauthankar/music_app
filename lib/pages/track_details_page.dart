import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/blocs/bookmark_bloc/bloc/bookmark_bloc.dart';
import 'package:music_app/blocs/track_details_bloc/bloc/track_details_bloc.dart';
import 'package:music_app/models/models.dart';
import 'package:music_app/utils/helpers.dart';
import 'package:sizer/sizer.dart';

class TrackDetailsPage extends StatelessWidget {
  final Track? track;
  const TrackDetailsPage(this.track, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // handling the bookmark button
          BlocProvider(
            create: (context) =>
                BookmarkBloc()..add(CheckForBookmarkEvent(track!)),
            child: BlocBuilder<BookmarkBloc, BookmarkState>(
              builder: (context, state) {
                // if track is bookmarked, remove it.
                if (state is TrackIsBookmarkedState) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<BookmarkBloc>(context)
                          .add(RemoveFromBookmarkEvent(track!));
                    },
                    icon: const Icon(Icons.bookmark),
                  );
                }

                // if track is NOT bookmarked, add it.

                if (state is TrackIsNotBookmarkedState) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<BookmarkBloc>(context)
                          .add(AddToBookmarkEvent(track!));
                    },
                    icon: const Icon(Icons.bookmark_outline),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          BlocProvider(
            create: (context) =>
                TrackDetailsBloc()..add(GetTrackDetailsEvent(track: track!)),
            child: BlocConsumer<TrackDetailsBloc, TrackDetailsState>(
              listener: (context, state) {},
              builder: (context, state) {
                // loading state
                if (state is TrackDetailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // loaded state
                if (state is TrackDetailsLoaded) {
                  return _buildTrackDetailsCard(context, state);
                }

                // error state
                if (state is TrackDetailsError) {
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                }

                // else
                return Container();
              },
            ),
          ),

          // using the one more Provider here as its not possible
          // to call 2 events at a time,

          // also lyrics need its separate loading indicator to be shown
          // according to the demo video
          BlocProvider(
            create: (context) =>
                TrackDetailsBloc()..add(GetTrackLyricsEvent(track: track!)),
            child: BlocConsumer<TrackDetailsBloc, TrackDetailsState>(
              listener: (context, state) {},
              builder: (context, state) {
                // loading state
                if (state is TrackLyricsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // loaded state
                if (state is TrackLyricsLoaded) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Lyrics'),
                        Text(state.lyrics),
                      ],
                    ),
                  );
                }

                // error state
                if (state is TrackLyricsError) {
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                }

                // else
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackDetailsCard(
      BuildContext context, TrackDetailsLoaded state) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: colorScheme(context).primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTrackDetailsRow(
            context,
            icon: Icons.music_note_outlined,
            title: 'Track',
            value: state.trackDetails.trackName ?? '',
          ),
          spacer(height: 6),
          _buildTrackDetailsRow(
            context,
            icon: Icons.album_outlined,
            title: 'Album',
            value: state.trackDetails.albumName ?? '',
          ),
          spacer(height: 6),
          _buildTrackDetailsRow(
            context,
            icon: Icons.person_outline_rounded,
            title: 'Artist',
            value: state.trackDetails.artistName ?? '',
          ),
          spacer(height: 6),
          _buildTrackDetailsRow(
            context,
            icon: Icons.star_border,
            title: 'Ratings',
            value: state.trackDetails.trackRating.toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackDetailsRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title row
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: colorScheme(context).onPrimaryContainer,
              ),
            ),
            spacer(width: 4),
            Icon(
              icon,
              size: 16.sp,
              color: colorScheme(context).onPrimaryContainer,
            ),
          ],
        ),

        // value
        Text(value),
      ],
    );
  }
}
