part of 'bookmark_bloc.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoadingState extends BookmarkState {}

class BookmarkLoadedState extends BookmarkState {
  final List<Track> tracks;
  const BookmarkLoadedState(this.tracks);
}

class BookmarkErrorState extends BookmarkState {}

class TrackIsBookmarkedState extends BookmarkState {}

class TrackIsNotBookmarkedState extends BookmarkState {}
