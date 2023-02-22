import 'package:flutter_rick_and_morty/features/heroes_list/widgets/heroes_card.dart';
import 'package:flutter_rick_and_morty/repositories/rick_and_morty/rick_and_morty.dart';
import 'bloc/heroes_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroesList extends StatefulWidget {
  const HeroesList({super.key, required this.title});
  final String title;

  @override
  State<HeroesList> createState() => _HeroesListState();
}

class _HeroesListState extends State<HeroesList> {
  final heroesBloc = HeroesBloc();
  final scrollController = ScrollController();
  List<HeroResultDTO>? _heroes;
  bool isLoadingMore = false;

  @override
  void initState() {
    scrollController.addListener(_scroolListener);
    _loadData(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: BlocBuilder<HeroesBloc, HeroesState>(
          bloc: heroesBloc,
          builder: (context, state) {
            _heroes = state.heroes;
            return (_heroes == null)
                ? const Center(child: CupertinoActivityIndicator())
                : ListView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.all(10.0),
                    itemCount:
                        isLoadingMore ? _heroes!.length + 2 : _heroes!.length,
                    itemBuilder: (BuildContext context, int index) =>
                        HeroesCard(
                      index: index,
                      heroesList: _heroes!,
                      context: context,
                    ),
                  );
          },
        ),
      ),
    );
  }

  Future<void> _loadData(bool refresh) async {
    heroesBloc.add(DataLoadingEvent(isRefresh: refresh));
    setState(() {});
  }

  Future<void> _scroolListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
      });
      _loadData(true);
    }
    setState(() {
      isLoadingMore = false;
    });
  }
}
