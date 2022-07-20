class TrackDetails {
  int? trackId;
  String? trackName;
  int? trackRating;
  int? hasLyrics;
  String? albumName;
  String? artistName;

  TrackDetails({
    this.trackId,
    this.trackName,
    this.trackRating,
    this.hasLyrics,
    this.albumName,
    this.artistName,
  });

  TrackDetails.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    trackRating = json['track_rating'];
    hasLyrics = json['has_lyrics'];
    albumName = json['album_name'];
    artistName = json['artist_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_id'] = trackId;
    data['track_name'] = trackName;
    data['track_rating'] = trackRating;
    data['has_lyrics'] = hasLyrics;
    data['album_name'] = albumName;
    data['artist_name'] = artistName;
    return data;
  }
}
