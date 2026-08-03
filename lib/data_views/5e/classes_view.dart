import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/data_model_5e.dart';

class ClassesView extends StatelessWidget {
  const ClassesView({super.key, required this.onOpen});

  final Function(Class5e) onOpen;

  @override
  Widget build(BuildContext context) {
    var foregroundColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white;

    return Table(
      children: [
        const TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                child: Text(
                  "Class",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TableCell(
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
        for (var (index, class5e) in DataModel5e.classes.indexed)
          TableRow(
            decoration: BoxDecoration(
              color: index % 2 == 0 ? foregroundColor.withAlpha(30) : null,
            ),
            children: [
              TableCell(
                child: GestureDetector(
                  onTap: () => onOpen(class5e),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 4.0,
                    ),
                    child: Text(class5e.name, textAlign: TextAlign.center),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 4.0,
                  ),
                  child: Text(class5e.source, textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
