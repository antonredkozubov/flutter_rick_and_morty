part of 'heroes_bloc.dart';

abstract class HeroesEvent extends Equatable {
  const HeroesEvent();

  @override
  List<Object> get props => [];
}

class DataLoadingEvent extends HeroesEvent {
  final bool isRefresh;

  DataLoadingEvent({required this.isRefresh});
}

class OnShowDetails extends HeroesEvent { 
  final int id; 
  final String title;
  final BuildContext context;
  OnShowDetails({required this.id, required this.title, required this.context});
}