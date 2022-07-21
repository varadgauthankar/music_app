import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/blocs/track_details_bloc/repository/track_details_repository.dart';
import 'package:music_app/blocs/track_details_bloc/repository/track_details_repository_impl.dart';
import 'package:music_app/models/models.dart';

part 'track_details_event.dart';
part 'track_details_state.dart';

class TrackDetailsBloc extends Bloc<TrackDetailsEvent, TrackDetailsState> {
  final TrackDetailsRepository _repository = TrackDetailsRepositoryImpl();
  TrackDetailsBloc() : super(TrackDetailsInitial()) {
    // get track details event
    on<GetTrackDetailsEvent>((event, emit) async {
      emit(TrackDetailsLoading());

      try {
        final trackDetails = await _repository.getTrackDetails(event.track);
        emit(TrackDetailsLoaded(trackDetails));
      } catch (e) {
        emit(TrackDetailsError());
      }
    });

    // get track lyrics event
    on<GetTrackLyricsEvent>((event, emit) async {
      emit(TrackLyricsLoading());
      try {
        final trackLyrics = await _repository.getTrackLyrics(event.track);
        emit(TrackLyricsLoaded(trackLyrics));
      } catch (e) {
        emit(TrackLyricsError());
      }
    });
  }
}
