import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/rick_and_morty.dart';

import '../../../hero_details/view/details_arguments.dart';

part 'heroes_event.dart';
part 'heroes_state.dart';

class HeroesBloc extends Bloc<HeroesEvent, HeroesState> {
  HeroesBloc({required this.repository}) : super(HeroesState()) {
    on<DataLoadingEvent>(_dataLoading);
    on<OnShowDetails>(_onShowDetails);
  }

  final AbstractRickAndMortyRepository repository;

  _dataLoading(DataLoadingEvent event, Emitter<HeroesState> emit) async {
    final heroes = await repository.getCharacterList(event.isRefresh);
    // emit(state.copyWith(heroes: heroes));
    emit(CharactersLoaded(heroes: heroes));
  }

  _onShowDetails(OnShowDetails event, Emitter<HeroesState> emit) {
    Navigator.of(event.context).pushNamed(
      '/info',
      arguments: DetailsArguments(event.title, event.id),
    );
  }
}
