import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'music_bloc_event.dart';
part 'music_bloc_state.dart';

class MusicBlocBloc extends Bloc<MusicBlocEvent, MusicBlocState> {
  MusicBlocBloc() : super(MusicBlocInitial()) {
    on<MusicBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
