// import 'package:diary/core/functions.dart';
// import 'package:diary/diary_cell_edit_screen/bloc_confirm_button_widget.dart';
// import 'package:diary/diary_cell_edit_screen/bloc_discard_button_widget.dart';
// import 'package:diary/diary_cell_edit_screen/bloc_dropdown_alignment_widget.dart';
// import 'package:diary/diary_cell_edit_screen/settings_panel_widget.dart';
// import 'package:diary/diary_list_screen/diary_cell_widget.dart';
// import 'package:diary/model/diary_cell.dart';
// import 'package:flutter/material.dart';

// class CellEditScreenWidget extends StatelessWidget {
//   const CellEditScreenWidget({
//     super.key,
//     required this.diaryCell,
//   });

//   final Widget diaryCell;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Flexible(
//               child: FractionallySizedBox(
//                 heightFactor: 0.3, //Должно зависеть от settings?
//                 //widthFactor: 0.7,
//                 child: Center(
//                   child: diaryCell,
//                 ),
//               ),
//               // DiaryCellWidget.common(
//               //   content: diaryCell.content,
//               //   onTap: () {},
//               //   alignment: converterAlignmentFromAlignmentsEnum(
//               //       diaryCell.settings.alignment),
//               // ),
//             ),
//             const Divider(
//               height: 8,
//               thickness: 4,
//               indent: 120,
//               endIndent: 120,
//             ),
//             SettingsPanelWidget(
//               dropdownAlignmentWidget: BlocDropdownAlignmentWidget(),
//               confirmChangesButton: BlocConfirmChangesButtonWidget(),
//               discardChangesButton: BlocDiscardChangesButtonWidget(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
