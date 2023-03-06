part of 'heroes_bloc.dart';

@immutable 
class HeroesState extends Equatable { 
  const HeroesState();

  @override
  List<Object?> get props => [];
}

class CharactersLoaded extends HeroesState {
  final List<HeroResultDTO>? heroes;

  const CharactersLoaded({required this.heroes});
}