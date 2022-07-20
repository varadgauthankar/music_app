import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:music_app/blocs/tracks_bloc/repository/tracks_repository.dart';
import 'package:music_app/global/dio/dio.dart';
import 'package:music_app/models/models.dart';

class TracksRepositoryImpl implements TracksRepository {
  @override
  Future<List<Track>?> getTracks() async {
    List<Track> tracks = [];

    Dio dio = await MyDio.provideDio();

    final result = await dio.get('/chart.tracks.get');

    final tracksJson = jsonDecode(result.data)['message']['body']['track_list'];

    for (final track in tracksJson) {
      tracks.add(Track.fromJson(track['track']));
    }
    return tracks;
  }
}
