// import 'package:diary/diary_list_screen/cell_edit_panel/bloc_settings_icon_button_widget.dart';
// import 'package:diary/diary_list_screen/cell_edit_panel/textfield_widget.dart';
// import 'package:diary/model/diary_cell.dart';
// import 'package:flutter/material.dart';

// class DiaryCellEditPanel extends StatelessWidget {
//   const DiaryCellEditPanel({
//     super.key,
//     required this.controller,
//     required this.diaryCell,
//     required this.onChanged,
//   });

//   final TextEditingController controller;
//   final DiaryCell diaryCell;
//   final Function(String?) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0), //const value
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Flexible(
//             child: FractionallySizedBox(
//               widthFactor: 0.7, //const value
//               child: TextFieldWidgetDelete.cell(
//                 diaryCell: diaryCell,
//                 controller: controller,
//                 onChanged: onChanged,
//               ),
//             ),
//           ),
//           BlocSettingsIconButtonWidget(diaryCell: diaryCell),
//           //возможно ещё кнопку хочу на редактирование размера текста, жирного шрифта или запихну это в alignment
//           //Надо ли подтверждающая кнопка?
//         ],
//       ),
//     );
//   }
// }
