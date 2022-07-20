import 'package:music_app/models/models.dart';

abstract class TracksRepository {
  Future<List<Track>?> getTracks();
}
