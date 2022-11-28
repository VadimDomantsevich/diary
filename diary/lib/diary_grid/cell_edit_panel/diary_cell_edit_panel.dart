import 'package:diary/diary_grid/cell_edit_panel/textfield_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';

class DiaryCellEditPanel extends StatelessWidget {
  const DiaryCellEditPanel({
    super.key,
    required this.controller,
    required this.diaryCell,
    required this.onChanged,
  });

  final TextEditingController controller;
  final DiaryCell diaryCell;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), //const value
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7, //const value
              child: TextFieldWidget.cell(
                diaryCell: diaryCell,
                controller: controller,
                onChanged: onChanged,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.border_all),
            ), //borderEditButton
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_align_center),
            ), //alignmentEditButton
            //возможно ещё кнопку хочу на редактирование размера текста, жирного шрифта или запихну это в alignment
            //Надо ли подтверждающая кнопка?
          ],
        ),
      ),
    );
  }
}
