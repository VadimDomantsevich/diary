import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderDataGridViewMode extends StatelessWidget {
  const BlocProviderDataGridViewMode({
    super.key,
    required this.widget,
  });

  final Widget widget;

  factory BlocProviderDataGridViewMode.listTheme({
    required Widget widget,
  }) {
    return BlocProviderDataGridViewMode(
      widget: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DiaryListService()),
        RepositoryProvider(create: (context) => DiaryColumnService()),
        RepositoryProvider(create: (context) => DiaryCellService()),
      ],
      child: BlocProvider(
        create: (context) => DiaryListBloc(
          RepositoryProvider.of<DiaryListService>(context),
          RepositoryProvider.of<DiaryColumnService>(context),
          RepositoryProvider.of<DiaryCellService>(context),
        ),
        child: Scaffold(
          body: widget,
        ),
      ),
    );
  }
}
