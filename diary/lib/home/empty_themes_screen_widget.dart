import 'package:diary/home/bloc_appbar_widget.dart';
import 'package:diary/home/list_theme_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyThemesScreenWidget extends StatelessWidget {
  const EmptyThemesScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(10, kToolbarHeight),
            child: BlocAppBarWidget(),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListThemeTextWidget.name(
                  content: AppLocalizations.of(context).emptyThemesNameText,
                ),
                ListThemeTextWidget.description(
                  content:
                      AppLocalizations.of(context).emptyThemesDescriptionText,
                ),
              ],
            ),
          )),
    );
  }
}
