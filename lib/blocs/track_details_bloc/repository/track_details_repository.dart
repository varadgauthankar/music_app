import 'package:music_app/models/models.dart';

abstract class TrackDetailsRepository {
  TrackDetails getTrackDetails(Track track);
  String getTrackLyrics(Track track);
}
