import 'package:auto_route/auto_route.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/home_screen/widgets/empty_themes_screen_widget.dart';
import 'package:diary/home_screen/widgets/themes_loaded_screen_widget.dart';
import 'package:diary/router/diary_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListThemesScreenWidget extends StatelessWidget {
  const BlocListThemesScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          themesLoaded: (listThemes) {
            return listThemes.isNotEmpty
                ? ThemesLoadedScreenWidget(
                    listThemes: listThemes,
                    onTap: (listTheme) {
                      context.router.push(
                        BlocProviderDataGridViewModeRoute(
                          listTheme: listTheme,
                        ),
                      );
                    },
                  )
                : const EmptyThemesScreenWidget();
          },
          orElse: () {
            context.read<DiaryListBloc>().add(
                  const DiaryListEvent.loadThemes(),
                );
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
