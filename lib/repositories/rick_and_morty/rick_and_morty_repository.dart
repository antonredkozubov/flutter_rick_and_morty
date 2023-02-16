import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/hero_model.dart';

class RickAndMortyRepository {
  
  Future<List<HeroResultResponse>> getCharacterList(int page) async {
      Response response = await Dio().get('https://rickandmortyapi.com/api/character/?page=$page');
      debugPrint(response.toString());
      final data = response.data as Map<String, dynamic>;
      return data['results'].map<HeroResultResponse>((json) => HeroResultResponse.fromJson(json)).toList();
  }

  Future<List<HeroResultResponse>> getCharacterInfo(String name) async {
      Response response = await Dio().get('https://rickandmortyapi.com/api/character/?page=$name');
      debugPrint(response.toString());
      final data = response.data as Map<String, dynamic>;
      return data['results'].map<HeroResultResponse>((json) => HeroResultResponse.fromJson(json)).toList();
  }
}
