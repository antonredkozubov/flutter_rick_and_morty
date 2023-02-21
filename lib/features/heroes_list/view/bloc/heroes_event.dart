part of 'heroes_bloc.dart';

abstract class HeroesEvent extends Equatable {
  const HeroesEvent();

  @override
  List<Object> get props => [];
}

class DataLoadingEvent extends HeroesEvent {
  // final List<HeroResultDTO> heroes;
  final bool isRefresh;

  DataLoadingEvent({required this.isRefresh});
}