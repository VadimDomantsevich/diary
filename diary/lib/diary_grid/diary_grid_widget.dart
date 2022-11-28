import 'package:flutter/material.dart';

class DiaryGridWidget extends StatelessWidget {
  const DiaryGridWidget({
    super.key,
    required this.columns,
    required this.cells,
  });

  final List<Widget> columns;
  final List<Widget> cells;

  @override
  Widget build(BuildContext context) {
    return Table();
  }
}
