// import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
// import 'package:diary/home/button.dart';
// import 'package:diary/model/diary_cell.dart';
// import 'package:diary/model/diary_column.dart';
// import 'package:diary/model/diary_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BuilderWidget extends StatelessWidget {
//   const BuilderWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DiaryListBloc, DiaryListState>(
//       builder: (context, state) {
//         return state.when(
//           initial: () => Container(),
//           listLoaded: (diaryList) =>
//               const Center(child: CircularProgressIndicator()),
//           columnsLoaded:
//               (DiaryList diaryList, List<DiaryColumn> diaryColumns) =>
//                   const Center(child: CircularProgressIndicator()),
//           loaded: (DiaryList diaryList, List<DiaryColumn> diaryColumns,
//               List<DiaryCell> diaryCells) {
//             return SafeArea(
//               child: Column(
//                 children: [
//                   //Что-то типа build_table, которая состоит из билд_одно, билд_второе
//                   Container(
//                     decoration: BoxDecoration(border: Border.all(width: 5)),
//                     child: Text(
//                         '${diaryList.listDate.month}.${diaryList.listDate.year}'),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(border: Border.all(width: 3)),
//                     child: Text(diaryColumns[0].name),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: diaryCells.length,
//                       itemBuilder: (context, index) {
//                         return Center(
//                           child: ListTile(
//                             title: Text('${diaryCells[index].content}'),
//                             subtitle: Text(
//                                 '${diaryCells[index].columnName},${diaryCells[index].columnPosition}.${diaryCells[index].day}.${diaryCells[index].dataType}'),
//                             onLongPress: () {},
//                             onTap: () {},
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//           cellUpdated: (DiaryList diaryList, List<DiaryColumn> diaryColumns,
//               List<DiaryCell> diaryCells) {
//             return Container();
//           },
//         );
//       },
//     );
//   }
// }
