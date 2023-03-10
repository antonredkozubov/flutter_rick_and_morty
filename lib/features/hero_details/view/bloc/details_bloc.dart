import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/rick_and_morty.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc({required this.repository}) : super(DetailsState()) {
    on<DataLoadingEvent>(_dataLoading);
  }

  final AbstractRickAndMortyRepository repository;

  _dataLoading(DataLoadingEvent event, Emitter<DetailsState> emit) async {
    final hero = await repository.getCharacterInfo(event.id);
    emit(CharacterLoaded(hero: hero));
  }
}
