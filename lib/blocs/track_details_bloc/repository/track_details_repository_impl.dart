import 'package:music_app/blocs/track_details_bloc/repository/track_details_repository.dart';
import 'package:music_app/models/models.dart';

class TrackDetailsRepositoryImpl implements TrackDetailsRepository {
  @override
  TrackDetails getTrackDetails(Track track) {
    return TrackDetails();
  }

  @override
  String getTrackLyrics(Track track) {
    throw UnimplementedError();
  }
}
