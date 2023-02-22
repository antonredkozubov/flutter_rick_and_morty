part of 'details_bloc.dart';


class DetailsState {
  final HeroResultDTO? hero;
  final bool isLoading;

  DetailsState({
    this.hero,
    this.isLoading = false,
  });

  DetailsState copyWith({
    HeroResultDTO? hero,
    bool isLoading = false,
  }) {
    return DetailsState(
      hero: hero ?? this.hero,
      isLoading: isLoading,
    );
  }
}