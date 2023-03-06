import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/models/hero_model.dart';
import 'package:flutter_rick_and_morty/features/heroes_list/view/bloc/heroes_bloc.dart';
import 'mock_heroes_service.dart';

void main() {
  group('Characters', () {
    late HeroesBloc heroesBloc;
    late MockCharacterService mockCharacterService;

    setUp(() {
      mockCharacterService = MockCharacterService();
      heroesBloc = HeroesBloc(repository: mockCharacterService);
    });

    blocTest<HeroesBloc, HeroesState>(
      'emits [CharactersLoading, CharactersLoaded] when NeedCharacters is added.',
      setUp: () {
        mockCharacterService.getCharactersSuccess();
      },
      build: () => HeroesBloc(repository: mockCharacterService),
      act: (bloc) => bloc.add(DataLoadingEvent(isRefresh: false)),
      expect: () => <HeroesState>[
        CharactersLoaded(heroes: [HeroResultDTO.empty()])
      ],
    );

    tearDown(() {
      heroesBloc.close();
    });
  });
}
