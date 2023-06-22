import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FaviroteMEalsNotifire extends StateNotifier<List<Meal>> {
  FaviroteMEalsNotifire() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealsISFavorite = state.contains(meal);

    if (mealsISFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FaviroteMEalsNotifire, List<Meal>>((ref) {
  return FaviroteMEalsNotifire();
});
