import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irida_qr/app/app.dart';
import 'package:irida_qr/l10n/l10n.dart';
import 'package:irida_qr/theme/theme.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppRouter(),
        ),
      ],
      child: BlocProvider(
        create: (context) => ThemeBloc(),
        child: const App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: (state is DarkTheme) ? darkTheme : lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: context.read<AppRouter>().config(),
        );
      },
    );
  }
}
