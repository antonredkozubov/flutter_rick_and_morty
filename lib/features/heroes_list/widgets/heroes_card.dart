import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_rick_and_morty/features/heroes_list/view/view.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/rick_and_morty.dart';

class HeroesCard extends StatelessWidget {
  const HeroesCard({
    super.key,
    required this.heroesList,
    required this.context,
    required this.index,
    required this.heroesBloc,
  });

  final List<HeroResultDTO> heroesList;
  final BuildContext context;
  final int index;
  final HeroesBloc heroesBloc;

  @override
  Widget build(BuildContext context) {
    if (index < heroesList.length) {
      final hero = heroesList[index];
      return Container(
        child: BlocBuilder<HeroesBloc, HeroesState>(
          bloc: heroesBloc,
          builder: (context, state) {
            return  Card(
        // child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Ink.image(
                image: NetworkImage(hero.image),
                height: 240,
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {
                    heroesBloc.add(OnShowDetails(id: hero.id, title: hero.name, context: context));
                    // Navigator.of(context).pushNamed(
                    //   '/info',
                    //   arguments: DetailsArguments(hero.name, hero.id),
                    // );
                  },
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 186.0),
                    child: Text(
                      hero.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 16.0, right: 16.0),
                      child: Row(
                        children: <Widget>[
                          Text('Gender: ${hero.gender}', style: const TextStyle(fontWeight: FontWeight.bold),),
                          const Spacer(),
                          Text('Race: ${hero.species}', style: const TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )),
                ],
              ),
            ],
          ),
        );
          }
      )
      );
          // },
    } else {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }
  }
}
