// import 'package:auto_route/auto_route.dart';
// import 'package:diary/diary_cell_edit_screen/button_widget.dart';
// import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BlocDiscardChangesButtonWidget extends StatelessWidget {
//   const BlocDiscardChangesButtonWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
//         builder: ((context, state) {
//       return state.when(
//         cellSelected: ((diaryList, diaryCell) {
//           return ButtonWidget.discard(onPressed: () => context.router.pop());
//         }),
//         editing: ((diaryList, diaryCell) {
//           return ButtonWidget.discard(onPressed: () => context.router.pop());
//         }),
//       );
//     }));
//   }
// }
