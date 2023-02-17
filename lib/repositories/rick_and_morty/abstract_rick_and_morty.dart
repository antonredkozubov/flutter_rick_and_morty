import 'models/hero_model.dart';

abstract class AbstractRickAndMortyRepository { 
  Future<List<HeroResultDTO>?> getCharacterList(bool refresh);
  Future<HeroResultDTO> getCharacterInfo(int id);
}