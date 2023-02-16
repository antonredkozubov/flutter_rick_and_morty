import '../features/hero_details/view/heroes_info_screen.dart';
import '../features/heroes_list/view/heroes_list_screen.dart';

final routes = {
  '/': (context) => const HeroesList(title: 'Rick and Morty'),
  '/info': (context) => const HeroesInfoScreen(),
};
