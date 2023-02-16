import 'package:flutter/material.dart';
import '../../../repositories/rick_and_morty/models/hero_model.dart';

class HeroesCard extends StatelessWidget {
  const HeroesCard({
    super.key,
    required this.heroesList,
    required this.context,
    required this.index,
  });

  final List<HeroResultResponse> heroesList;
  final BuildContext context;
  final int index;

  @override
  Widget build(BuildContext context) {
    final hero = heroesList[index];
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Ink.image(
              image: NetworkImage(hero.image),
              height: 240,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/info',
                    arguments: hero.name,
                  );
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
                        Text('Gender: ${hero.gender}'),
                        const Spacer(),
                        Text('Race: ${hero.species}'),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
