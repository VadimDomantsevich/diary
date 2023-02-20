// import 'package:auto_route/auto_route.dart';
// import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
// import 'package:diary/diary_list_screen/cell_edit_panel/icon_button_widget.dart';
// import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
// import 'package:diary/model/diary_cell.dart';
// import 'package:diary/router/diary_router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BlocSettingsIconButtonWidget extends StatelessWidget {
//   const BlocSettingsIconButtonWidget({
//     super.key,
//     required this.diaryCell,
//   });

//   final DiaryCell diaryCell;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
//       builder: (context, state) {
//         return state.maybeWhen(
//           cellSelected: (diaryList, stateDiaryCell) {
//             return IconButtonWidget.settings(
//               onPressed: () async {
//                 context.read<DiaryCellEditBloc>().add(
//                       EditCellEvent(
//                         diaryList: diaryList,
//                         diaryCell: diaryCell,
//                       ),
//                     );
//                 await context.router
//                     .push(
//                       BlocCellEditScreenWidgetRoute(
//                         diaryList: diaryList,
//                         diaryCell: diaryCell,
//                       ),
//                     )
//                     .whenComplete(
//                       () => context.read<DiaryListBloc>().add(
//                             ChangeDiaryCellEvent(diaryCell: diaryCell),
//                           ),
//                     );
//               },
//             );
//           },
//           editing: (diaryList, stateDiaryCell) {
//             return IconButtonWidget.settings(
//               onPressed: () async {
//                 context.read<DiaryCellEditBloc>().add(
//                       EditCellEvent(
//                         diaryList: diaryList,
//                         diaryCell: diaryCell,
//                       ),
//                     );
//                 await context.router
//                     .push(
//                       BlocCellEditScreenWidgetRoute(
//                         diaryList: diaryList,
//                         diaryCell: diaryCell,
//                       ),
//                     )
//                     .whenComplete(
//                       () => context.read<DiaryListBloc>().add(
//                             ChangeDiaryCellEvent(diaryCell: diaryCell),
//                           ),
//                     );
//               },
//             );
//           },
//           orElse: () => Container(),
//         );
//       },
//     );
//   }
// }
