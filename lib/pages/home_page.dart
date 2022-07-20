import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/blocs/tracks_bloc/bloc/tracks_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tracks')),
        body: BlocProvider(
          create: (context) => TracksBloc()..add(GetTracksEvent()),
          child: BlocConsumer<TracksBloc, TracksState>(
            listener: (context, state) {},
            builder: (context, state) {
              print(state);
              if (state is TracksLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TracksLoaded) {
                return ListView.builder(
                  itemCount: state.tracks?.length,
                  itemBuilder: ((context, index) {
                    final track = state.tracks?.elementAt(index);
                    return Text(track?.trackName ?? '');
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
