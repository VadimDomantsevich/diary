import 'package:diary/l10n/all_locales.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'locale/locale_bloc.dart';
import 'router/diary_router.gr.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (context) => LocaleBloc(),
    child: DiaryApp(),
  ));
}

class DiaryApp extends StatelessWidget {
  DiaryApp({super.key});
  final _diaryRouter = DiaryRouter();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocBuilder<LocaleBloc, LocaleState>(
              builder: (context, state) {
                return MaterialApp.router(
                  supportedLocales: AllLocale.all,
                  locale: state.locale,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  routerDelegate: _diaryRouter.delegate(),
                  routeInformationParser: _diaryRouter.defaultRouteParser(),
                );
              },
            );
          }
          return Container();
        });
  }
}
