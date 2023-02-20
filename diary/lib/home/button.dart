import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      onPressed: () {
        context.read<DiaryListBloc>().add(
              DiaryListEvent.getDiaryList(date: DateTime.now()),
            );
      },
      // onPressed: () => context
      //     .read<DiaryListBloc>()
      //     .add(const DiaryListEvent.createSample()),
      child: const Icon(Icons.add),
    );
  }
}
