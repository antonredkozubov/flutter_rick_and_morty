import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/rick_and_morty.dart';

part 'heroes_event.dart';
part 'heroes_state.dart';

class HeroesBloc extends Bloc<HeroesEvent, HeroesState> {
  HeroesBloc() : super(HeroesState()) {
    on<DataLoadingEvent>(_dataLoading);
  }

  _dataLoading(DataLoadingEvent event, Emitter<HeroesState> emit) async {
    emit(state.copyWith(isLoading: true));
    final _heroes =
        await GetIt.I<AbstractRickAndMortyRepository>().getCharacterList(false);
    emit(state.copyWith(heroes: _heroes));
  }
}
