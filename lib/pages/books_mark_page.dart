import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/blocs/bookmark_bloc/bloc/bookmark_bloc.dart';
import 'package:music_app/pages/track_details_page.dart';
import 'package:music_app/widgets/bookmark_card_widget.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookmarks'),
      ),
      body: BlocProvider(
        create: (context) => BookmarkBloc()..add(GetBookmarkedTracks()),
        child: BlocConsumer<BookmarkBloc, BookmarkState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BookmarkLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BookmarkLoadedState) {
              if (state.tracks.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.tracks.length,
                  itemBuilder: (BuildContext context, int index) {
                    final track = state.tracks.elementAt(index);
                    return BookmarkCardWidget(
                      track,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => TrackDetailsPage(track)),
                        ),
                      )

                          // used to refresh the list
                          .then(
                        (value) => BlocProvider.of<BookmarkBloc>(context)
                            .add(GetBookmarkedTracks()),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('No bookmarks yet!'));
              }
            }

            return Container();
          },
        ),
      ),
    );
  }
}
