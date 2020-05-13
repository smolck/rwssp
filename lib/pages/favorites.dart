import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/verse_card.dart';
import '../database.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppDB>(
      builder: (context, appDb, _) {
        return FutureBuilder<List<String>>(
          future: () async {
            final favorites =
                await Provider.of<AppDB>(context).query('favorites');

            return favorites.map((x) => x['reference'] as String).toList();
          }(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // TODO
              final children = snapshot.data
                  .map((x) => VerseCard(
                        text: 'TODO',
                        reference: x,
                      ))
                  .toList();

              return ListView(
                children: children,
              );
            } else {
              // TODO
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
