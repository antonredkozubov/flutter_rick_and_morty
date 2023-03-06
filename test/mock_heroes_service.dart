import 'package:flutter_rick_and_morty/repositories/rick_and_morty/abstract_rick_and_morty.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/models/hero_model.dart';

class MockCharacterService implements AbstractRickAndMortyRepository {
  late List<HeroResultDTO>? getCharactersList;
  late HeroResultDTO getCharacter;

  @override
  Future <List<HeroResultDTO>?> getCharacterList(bool refresh) async {
    return getCharactersList;
  }

  void getCharactersSuccess() {
    final List<HeroResultDTO> characters = [HeroResultDTO.empty()];
    getCharactersList = characters;
  }

  @override
  Future <HeroResultDTO> getCharacterInfo(int id) async {
    return getCharacter;
  }

  void getCharacterDetailsSuccess() {
    getCharacter = HeroResultDTO.empty();
  }
  
}