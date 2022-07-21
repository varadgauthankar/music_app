part of 'track_details_bloc.dart';

abstract class TrackDetailsState extends Equatable {
  const TrackDetailsState();

  @override
  List<Object> get props => [];
}

// track Details State
class TrackDetailsInitial extends TrackDetailsState {}

class TrackDetailsLoading extends TrackDetailsState {}

class TrackDetailsLoaded extends TrackDetailsState {
  final TrackDetails trackDetails;
  const TrackDetailsLoaded(this.trackDetails);
}

class TrackDetailsError extends TrackDetailsState {}

// track lyrics state

class TrackLyricsInitial extends TrackDetailsState {}

class TrackLyricsLoading extends TrackDetailsState {}

class TrackLyricsLoaded extends TrackDetailsState {
  final String lyrics;
  const TrackLyricsLoaded(this.lyrics);
}

class TrackLyricsError extends TrackDetailsState {}
