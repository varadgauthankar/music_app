part of 'track_details_bloc.dart';

abstract class TrackDetailsEvent extends Equatable {
  const TrackDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetTrackDetailsEvent extends TrackDetailsEvent {
  final Track track;

  const GetTrackDetailsEvent({required this.track});

  @override
  List<Object> get props => [track];
}

class GetTrackLyricsEvent extends TrackDetailsEvent {
  final Track track;

  const GetTrackLyricsEvent({required this.track});

  @override
  List<Object> get props => [track];
}
