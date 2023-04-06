import 'package:diary/home_screen/bloc_widgets/bloc_appbar_widget.dart';
import 'package:diary/home_screen/widgets/list_theme_view_widget.dart';
import 'package:diary/model/list_theme.dart';
import 'package:flutter/material.dart';

class ThemesLoadedScreenWidget extends StatelessWidget {
  const ThemesLoadedScreenWidget({
    super.key,
    required this.listThemes,
    required this.onTap,
  });

  final List<ListTheme> listThemes;
  final Function(ListTheme) onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(10, kToolbarHeight),
          child: BlocAppBarWidget(),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: listThemes.length,
          itemBuilder: (context, index) {
            return ListThemeViewWidget(
              listTheme: listThemes[index],
              onTap: onTap,
            );
          },
        ),
      ),
    );
  }
}
