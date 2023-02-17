import 'package:flutter_rick_and_morty/features/hero_details/view/view.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rick_and_morty/repositories/rick_and_morty/rick_and_morty.dart';

class HeroesInfoScreen extends StatefulWidget {
  const HeroesInfoScreen({super.key});

  @override
  State<HeroesInfoScreen> createState() => _HeroesInfoScreenState();
}

class _HeroesInfoScreenState extends State<HeroesInfoScreen> {
  HeroResultDTO? _hero;
  int? id;
  String? _heroName;

  @override
  void didChangeDependencies() {
    final heroName =
        ModalRoute.of(context)?.settings.arguments as DetailsArguments;
    _heroName = heroName.title;
    id = heroName.id;
    _loadData();
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_heroName ?? ""),
      ),
      body: (_hero == null)
          ? const Center(child: CupertinoActivityIndicator())
          : LayoutBuilder(
              builder: (context, boxConstraints) {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: Image.network(
                              _hero?.image ?? "",
                              width: 300,
                              height: 300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          color: Colors.amber,
                          child: Text("Name: ${_hero?.name}"),
                        ),
                        Container(
                          color: Colors.amber,
                          child: Text("Gender: ${_hero?.gender}"),
                        ),
                        Container(
                          color: Colors.amber,
                          child: Text("Status: ${_hero?.status}"),
                        ),
                        Container(
                          color: Colors.amber,
                          child: Text("Species: ${_hero?.species}"),
                        ),
                        Container(
                          color: Colors.amber,
                          child: Text("Episodes: ${_hero?.episodes.length}"),
                        ),
                        Container(
                          color: Colors.amber,
                          child: Text("Last location: ${_hero?.location.name}"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<void> _loadData() async {
    _hero = await GetIt.I<AbstractRickAndMortyRepository>()
        .getCharacterInfo(id ?? 1);
    setState(() {});
  }
}
