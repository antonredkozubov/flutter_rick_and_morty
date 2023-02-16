import 'package:flutter_rick_and_morty/features/heroes_list/widgets/heroes_card.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/rick_and_morty_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../repositories/rick_and_morty/models/hero_model.dart';

class HeroesList extends StatefulWidget {
  const HeroesList({super.key, required this.title});
  final String title;

  @override
  State<HeroesList> createState() => _HeroesListState();
}

class _HeroesListState extends State<HeroesList> {
  List<HeroResultResponse>? _heroes;
  int page = 1;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: (_heroes == null)
          ? const Center(child: CupertinoActivityIndicator())
          : ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: _heroes!.length,
              itemBuilder: (BuildContext context, int index) => HeroesCard(
                index: index,
                heroesList: _heroes!,
                context: context,
              ),
            ),
    );
  }

  Future<void> _loadData() async {
    _heroes = await RickAndMortyRepository().getCharacterList(page);
    setState(() {});
  }
}
