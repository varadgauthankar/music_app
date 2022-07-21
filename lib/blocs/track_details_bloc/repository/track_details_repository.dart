import 'package:music_app/models/models.dart';

abstract class TrackDetailsRepository {
  Future<TrackDetails> getTrackDetails(Track track);
  Future<String> getTrackLyrics(Track track);
}
