import 'package:equatable/equatable.dart';

class Track extends Equatable {
  int? trackId;
  String? trackName;
  String? albumName;
  String? artistName;

  Track({
    this.trackId,
    this.trackName,
    this.albumName,
    this.artistName,
  });

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    albumName = json['album_name'];
    artistName = json['artist_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_id'] = trackId;
    data['track_name'] = trackName;
    data['album_name'] = albumName;
    data['artist_name'] = artistName;
    return data;
  }

  @override
  List<Object?> get props => [trackId, trackName, albumName, artistName];
}
