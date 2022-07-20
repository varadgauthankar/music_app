import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/blocs/tracks_bloc/repository/tracks_repository.dart';
import 'package:music_app/blocs/tracks_bloc/repository/tracks_repository_impl.dart';
import 'package:music_app/models/models.dart';

part 'tracks_event.dart';
part 'tracks_state.dart';

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  final TracksRepository _repository = TracksRepositoryImpl();

  TracksBloc() : super(TracksInitial()) {
    on<TracksEvent>((event, emit) async {
      emit(TracksLoading());
      try {
        final tracks = await _repository.getTracks();
        emit(TracksLoaded(tracks: tracks));
      } catch (e) {
        emit(TracksError());
      }
    });
  }
}
