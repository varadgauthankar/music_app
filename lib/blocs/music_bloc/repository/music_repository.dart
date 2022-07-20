import 'package:music_app/models/models.dart';

abstract class MusicRepository {
  List<Track> getTracks();
  TrackDetails getTrackDetails(Track track);
  String getTrackLyrics(Track track);
}
