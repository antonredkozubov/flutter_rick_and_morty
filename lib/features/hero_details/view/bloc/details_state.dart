part of 'details_bloc.dart';


// class DetailsState {
//   final HeroResultDTO? hero;
//   final bool isLoading;

//   DetailsState({
//     this.hero,
//     this.isLoading = false,
//   });

//   DetailsState copyWith({
//     HeroResultDTO? hero,
//     bool isLoading = false,
//   }) {
//     return DetailsState(
//       hero: hero ?? this.hero,
//       isLoading: isLoading,
//     );
//   }
// }

@immutable 
class DetailsState extends Equatable { 
  const DetailsState();

  @override
  List<Object?> get props => [];
}

class CharacterLoaded extends DetailsState {
  final HeroResultDTO hero;

  const CharacterLoaded({required this.hero});

  @override
  List<Object?> get props => [hero];
}