import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/track.dart';
import 'package:music_app/services/bookmark_service.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final BookMarkService _bookMarkService = BookMarkService();

  BookmarkBloc() : super(BookmarkInitial()) {
    // get bookmarked tracks
    on<GetBookmarkedTracks>((event, emit) async {
      try {
        emit(BookmarkLoadingState());
        final tracks = await _bookMarkService.getBookMarkedTracks();
        emit(BookmarkLoadedState(tracks));
      } catch (e) {
        emit(BookmarkErrorState());
      }
    });

    // bookmark track
    on<AddToBookmarkEvent>((event, emit) {
      _bookMarkService.addToBookMark(event.track);
      emit(TrackIsBookmarkedState());
    });

    // remove bookmark
    on<RemoveFromBookmarkEvent>((event, emit) {
      _bookMarkService.removeFromBookMark(event.track);
      emit(TrackIsNotBookmarkedState());
    });

    // check is track is bookmarked
    on<CheckForBookmarkEvent>((event, emit) async {
      final isBookmarked = await _bookMarkService.isBookmarked(event.track);

      if (isBookmarked) {
        emit(TrackIsBookmarkedState());
      } else {
        emit(TrackIsNotBookmarkedState());
      }
    });
  }
}
