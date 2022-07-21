import 'dart:convert';

import 'package:music_app/models/track.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkService {
  final _prefsKey = 'track';

  void addToBookMark(Track track) async {
    final prefs = await SharedPreferences.getInstance();
    final listFromPrefs = prefs.getStringList(_prefsKey) ?? [];

    listFromPrefs.add(jsonEncode(track.toJson()));

    prefs.setStringList(_prefsKey, listFromPrefs);
  }

  void removeFromBookMark(Track track) async {
    final prefs = await SharedPreferences.getInstance();
    final listFromPrefs = prefs.getStringList(_prefsKey) ?? [];

    listFromPrefs.remove(jsonEncode(track.toJson()));

    prefs.setStringList(_prefsKey, listFromPrefs);
  }

  Future<List<Track>> getBookMarkedTracks() async {
    final prefs = await SharedPreferences.getInstance();
    final listFromPrefs = prefs.getStringList(_prefsKey) ?? [];

    List<Track> trackLists = [];

    for (final track in listFromPrefs) {
      trackLists.add(Track.fromJson(jsonDecode(track)));
    }

    return trackLists;
  }

  Future<bool> isBookmarked(Track track) async {
    final prefs = await SharedPreferences.getInstance();
    final listFromPrefs = prefs.getStringList(_prefsKey) ?? [];

    List<Track> trackLists = [];

    for (final track in listFromPrefs) {
      trackLists.add(Track.fromJson(jsonDecode(track)));
    }

    if (trackLists.contains(track)) {
      return true;
    } else {
      return false;
    }
  }
}
