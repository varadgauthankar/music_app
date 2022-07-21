import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/blocs/tracks_bloc/bloc/tracks_bloc.dart';
import 'package:music_app/pages/books_mark_page.dart';
import 'package:music_app/pages/track_details_page.dart';
import 'package:music_app/widgets/track_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tracks'),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => const BookMarkPage())),
              ),
              icon: const Icon(Icons.bookmark_outline),
            )
          ],
        ),
        body: BlocProvider(
          create: (context) => TracksBloc()..add(GetTracksEvent()),
          child: BlocConsumer<TracksBloc, TracksState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is TracksLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TracksLoaded) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.tracks?.length,
                  itemBuilder: ((context, index) {
                    final track = state.tracks?.elementAt(index);
                    return TrackCard(
                      track,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => TrackDetailsPage(track)),
                          )),
                    );
                  }),
                );
              }

              if (state is TracksError) {
                return const Center(child: Text('Something went wrong!'));
              }

              return Container();
            },
          ),
        ));
  }
}
