import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_rick_and_morty/features/hero_details/view/bloc/details_bloc.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/models/hero_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mock_heroes_service.dart';

void main() {
  group('Characters', () {
    late DetailsBloc detailsBloc;
    late MockCharacterService mockCharacterService;

    setUp(() {
      mockCharacterService = MockCharacterService();
      detailsBloc = DetailsBloc(repository: mockCharacterService);
    });

    blocTest<DetailsBloc, DetailsState>(
      'emits [CharactersLoading, CharactersLoaded] when NeedCharacters is added.',
      setUp: () {
        mockCharacterService.getCharacterDetailsSuccess();
      },
      build: () => DetailsBloc(repository: mockCharacterService),
      act: (bloc) => bloc.add(DataLoadingEvent(id: 1)),
      expect: () =>
          <DetailsState>[CharacterLoaded(hero: HeroResultDTO.empty())],
    );

    tearDown(() {
      detailsBloc.close();
    });
  });
}
