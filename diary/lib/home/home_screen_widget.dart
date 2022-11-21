import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/home/builder.dart';
import 'package:diary/home/button.dart';
import 'package:diary/locale/locale_bloc.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

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
          child: const Scaffold(
            body: BuilderWidget(),
            floatingActionButton: ButtonWidget(),
          ),
        ));
    // return Scaffold(
    //   body: StreamBuilder(
    //     stream: DiaryListService().getAll().asStream(),
    //     builder: (context, item) {
    //       if (item.hasData) {
    //         return ListView.builder(
    //           itemCount: item.data!.length,
    //           itemBuilder: ((context, index) {
    //             return Card(
    //               child: ListTile(
    //                 title: Text(item.data![index].listDate.toString()),
    //                 subtitle: Text(item.data![index].uid),
    //                 onTap: () => DiaryColumnService().create(
    //                     name: 'Date', count: 2, diaryList: item.data![index]),
    //                 onLongPress: () async {
    //                   final doc = await FirebaseFirestore.instance
    //                       .collection(Collections.usersCollection)
    //                       .doc(FirebaseAuth.instance.currentUser!.uid)
    //                       .collection(Collections.diaryListsCollection)
    //                       .doc(
    //                           '${item.data![index].listDate.month}.${item.data![index].listDate.year}')
    //                       .collection(Collections.diaryColumnsCollection)
    //                       .doc('Date')
    //                       .get();
    //                   DiaryColumnService().delete(doc: doc);
    //                 },
    //               ),
    //             );
    //           }),
    //         );
    //       } else
    //         return Container();
    //     },
    //   ),
    // );
  }
}
