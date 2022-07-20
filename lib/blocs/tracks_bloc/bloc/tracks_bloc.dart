import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/models.dart';

part 'tracks_event.dart';
part 'tracks_state.dart';

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  TracksBloc() : super(TracksInitial()) {
    on<TracksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
