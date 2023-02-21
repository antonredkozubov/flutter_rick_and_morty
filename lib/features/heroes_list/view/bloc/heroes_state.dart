part of 'heroes_bloc.dart';

class HeroesState {
  final List<HeroResultDTO> heroes;
  final bool isLoading;

  HeroesState({
    this.heroes = const [],
    this.isLoading = false,
  });

  HeroesState copyWith({
    List<HeroResultDTO>? heroes,
    bool isLoading = false,
  }) {
    return HeroesState(
      heroes: heroes ?? this.heroes,
      isLoading: isLoading,
    );
  }
}