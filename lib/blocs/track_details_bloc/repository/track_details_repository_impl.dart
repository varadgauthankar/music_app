import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:music_app/blocs/track_details_bloc/repository/track_details_repository.dart';
import 'package:music_app/global/dio/dio.dart';
import 'package:music_app/models/models.dart';

class TrackDetailsRepositoryImpl implements TrackDetailsRepository {
  @override
  Future<TrackDetails> getTrackDetails(Track track) async {
    Dio dio = await MyDio.provideDio();

    final result = await dio.get(
      '/track.get',
      queryParameters: {'track_id': track.trackId},
    );

    final json = jsonDecode(result.data)['message']['body']['track'];

    return TrackDetails.fromJson(json);
  }

  @override
  Future<String> getTrackLyrics(Track track) async {
    Dio dio = await MyDio.provideDio();

    final result = await dio.get(
      '/track.lyrics.get',
      queryParameters: {'track_id': track.trackId},
    );

    final lyrics =
        jsonDecode(result.data)['message']['body']['lyrics']['lyrics_body'];

    return lyrics;
  }
}
