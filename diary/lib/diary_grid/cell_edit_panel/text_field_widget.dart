import 'package:diary/core/functions.dart';
import 'package:diary/diary_grid/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.diaryCell,
  });

  final DiaryCell diaryCell;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        TextEditingController(text: widget.diaryCell.content.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // setState(() {
    //   widget.diaryCell.copyWith(content: _controller.text); // Говнище
    //   _controller =
    //       TextEditingController(text: widget.diaryCell.content.toString());
    // });
    // return TextField(
    //     controller: _controller,
    //     keyboardType: converterFromDataTypesEnum(widget.diaryCell.dataType),
    //     //onSubmitted: widget.onChanged(_controller.text),
    //     onChanged: (value) {
    //       context.read<DiaryCellEditBloc>().add(
    //             EditCellEvent(
    //                 diaryCell: widget.diaryCell,
    //                 dataType: widget.diaryCell.dataType,
    //                 content: value),
    //           );
    //       context.read<DiaryListBloc>().add(UpdateDiaryCellEvent(diaryCell: widget.diaryCell));
    //     });
  }
}
