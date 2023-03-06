// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'repositories/rick_and_morty/rick_and_morty.dart';
import 'rick_and_morty_app.dart';

void main() {
  // GetIt.I.registerLazySingleton<AbstractRickAndMortyRepository>(
  //     () => RickAndMortyRepository(dio: Dio()));
  runApp(const RickAndMortyApp());
}
