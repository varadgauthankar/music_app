import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/track.dart';

part 'track_details_event.dart';
part 'track_details_state.dart';

class TrackDetailsBloc extends Bloc<TrackDetailsEvent, TrackDetailsState> {
  TrackDetailsBloc() : super(TrackDetailsInitial()) {
    on<TrackDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
