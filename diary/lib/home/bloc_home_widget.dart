import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/home/bloc_datagrid_sample.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomeWidget extends StatelessWidget {
  const BlocHomeWidget({
    super.key,
    required this.isThemeTaken,
  });

  final bool isThemeTaken;

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
          body: BlocDataGridSample(
            isThemeTaken: isThemeTaken,
          ),
        ),
      ),
    );
  }
}
