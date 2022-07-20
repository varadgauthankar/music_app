part of 'track_details_bloc.dart';

abstract class TrackDetailsState extends Equatable {
  const TrackDetailsState();
  
  @override
  List<Object> get props => [];
}

class TrackDetailsInitial extends TrackDetailsState {}
