import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/rick_and_morty.dart';

import '../../../hero_details/view/details_arguments.dart';

part 'heroes_event.dart';
part 'heroes_state.dart';

class HeroesBloc extends Bloc<HeroesEvent, HeroesState> {
  HeroesBloc() : super(HeroesState()) {
    on<DataLoadingEvent>(_dataLoading);
    on<OnShowDetails>(_onShowDetails);
  }

  _dataLoading(DataLoadingEvent event, Emitter<HeroesState> emit) async {
    final _heroes = await GetIt.I<AbstractRickAndMortyRepository>()
        .getCharacterList(event.isRefresh);
    emit(state.copyWith(heroes: _heroes));
  }

  _onShowDetails(OnShowDetails event, Emitter<HeroesState> emit) {
    Navigator.of(event.context).pushNamed(
      '/info',
      arguments: DetailsArguments(event.title, event.id),
    );
  }
}
