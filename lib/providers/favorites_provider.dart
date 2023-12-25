import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final existingIndex = state.indexWhere(
      (element) => element.id == meal.id,
    );
    if (existingIndex >= 0) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    }
    state = [...state, meal];
    return true;
  }

  // void _toggleMealFavoriteStatus(Meal meal) {
  // }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
