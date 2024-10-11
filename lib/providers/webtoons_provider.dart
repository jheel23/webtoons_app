import 'package:anime_app/Database/local_database.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/models/webtoon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonsNotifier extends StateNotifier<List<Webtoon>> {
  WebtoonsNotifier() : super(initialData);
  String currentId = '';
  void toggleFavorite(Webtoon webtoon) {
    final index = state.indexOf(webtoon);
    state[index].favorite = !state[index].favorite;
    LocalDatabaseHelper.updateData('webtoons', Webtoon.toMap(webtoon));
    state = List.from(state);
  }

  void updateRating(Webtoon webtoon, double rating) {
    final index = state.indexOf(webtoon);
    state[index].rating = rating;
    LocalDatabaseHelper.updateData('webtoons', Webtoon.toMap(webtoon));
    state = List.from(state);
  }

  Webtoon findById() {
    return state.firstWhere((webtoon) => webtoon.id == currentId);
  }

  List<Webtoon> get getfavorites {
    return state.where((webtoon) => webtoon.favorite).toList();
  }
}

final webtoonsNotifierProvider =
    StateNotifierProvider<WebtoonsNotifier, List<Webtoon>>((ref) {
  return WebtoonsNotifier();
});
