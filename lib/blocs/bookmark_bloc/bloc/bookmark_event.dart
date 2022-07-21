part of 'bookmark_bloc.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class AddToBookmarkEvent extends BookmarkEvent {
  final Track track;
  const AddToBookmarkEvent(this.track);
}

class RemoveFromBookmarkEvent extends BookmarkEvent {
  final Track track;
  const RemoveFromBookmarkEvent(this.track);
}

class GetBookmarkedTracks extends BookmarkEvent {}

class CheckForBookmarkEvent extends BookmarkEvent {
  final Track track;
  const CheckForBookmarkEvent(this.track);
}
