import 'package:dio/dio.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/rick_and_morty.dart';

class RickAndMortyRepository implements AbstractRickAndMortyRepository {
  RickAndMortyRepository({
    required this.dio,
  });

  final Dio dio;
  final List<HeroResultDTO> _characters = [];
  int _page = 1;

  @override
  Future<List<HeroResultDTO>?> getCharacterList(bool refresh) async {
    if (refresh) { 
      _page++;
    } else { 
      _page = 1;
    }
    Response response =
        await dio.get('https://rickandmortyapi.com/api/character/?page=$_page');
    final data = response.data as Map<String, dynamic>;
    _characters.addAll(data['results']
        .map<HeroResultDTO>((json) => HeroResultDTO.fromJson(json))
        .toList());
    return _characters;
  }

  @override
  Future<HeroResultDTO> getCharacterInfo(int id) async {
    Response response =
        await dio.get('https://rickandmortyapi.com/api/character/$id');
    if (response.statusCode == 200) {
      final data = response.data;
      final character = HeroResultDTO.fromJson(data);
      return character;
    } else {
      throw Exception('Data loading error!');
    }
  }
}
