part of 'details_bloc.dart';

@immutable 
class DetailsState extends Equatable { 
  const DetailsState();

  @override
  List<Object?> get props => [];
}

class CharacterLoaded extends DetailsState {
  final HeroResultDTO hero;

  const CharacterLoaded({required this.hero});
}