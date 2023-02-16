import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../repositories/rick_and_morty/models/hero_model.dart';
import '../../../repositories/rick_and_morty/rick_and_morty_repository.dart';

class HeroesInfoScreen extends StatefulWidget {
  const HeroesInfoScreen({super.key});

  @override
  State<HeroesInfoScreen> createState() => _HeroesInfoScreenState();
}

class _HeroesInfoScreenState extends State<HeroesInfoScreen> {
List<HeroResultResponse>? _hero;
String? name;

  @override
  void didChangeDependencies() {
    final heroName = ModalRoute.of(context)?.settings.arguments;
    assert(heroName != null && heroName is String, "You must provide String args");
    name = heroName as String;
    setState(() { });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name ?? ""),),
      // body: (_hero == null)
      //     ? const Center(child: CupertinoActivityIndicator())
      //     : ListView.builder(
      //         padding: const EdgeInsets.only(top: 10),
      //         itemCount: _hero!.length,
      //         itemBuilder: (BuildContext context, int index) => (HeroesCard)(
      //           index: index,
      //           heroesList: _hero!,
      //           context: context,
      //         ),
      //       ),
    );
  }
  Future<void> _loadData() async {
    _hero = await RickAndMortyRepository().getCharacterInfo(name ?? "");
    setState(() {});
  }
}