import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/5e/spell_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/data_model_5e.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell.dart';

class SpellsView extends StatefulWidget {
  const SpellsView({super.key});

  @override
  State<SpellsView> createState() => _SpellsViewState();
}

class _SpellsViewState extends State<SpellsView> {
  List<Spell> spells = [];

  @override
  void initState() {
    search("");
    super.initState();
  }

  void search(String searchString) {
    setState(() {
      if (searchString.isEmpty) {
        spells = DataModel5e.spells.toList();
        return;
      }

      searchString = searchString.toLowerCase();
      spells = DataModel5e.spells
          .where((x) => x.searchCompare(searchString))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var foregroundColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextField(
          decoration: const InputDecoration(label: Text("Search")),
          onChanged: search,
        ),
        const Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                child: Text(
                  "Spell",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                child: Text(
                  "Source",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: spells.length,
            itemExtent: 32,
            itemBuilder: (context, i) => Container(
              decoration: BoxDecoration(
                color: i % 2 == 0 ? foregroundColor.withAlpha(30) : null,
              ),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 20.0,
                          ),
                          child: SingleChildScrollView(
                            child: SpellView(spell: spells[i], card: false),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 4.0,
                        ),
                        child: Text(
                          spells[i].name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 4.0,
                        ),
                        child: Text(
                          spells[i].source,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
