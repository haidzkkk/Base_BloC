import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/feature/commons/contants/theme.dart';
import 'package:spotify/feature/presentation/blocs/home/home_bloc.dart';
import 'package:spotify/feature/presentation/blocs/main/main_bloc_cubit.dart';
import 'feature/di/InjectionContainer.dart';
import 'feature/presentation/screen/home_screen/home_screen.dart';
import 'feature/di/InjectionContainer.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? locale;
  bool? darkMode;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(create: (context) => sl<MainBloc>()),
        BlocProvider<HomeBloc>(create: (context) => sl<HomeBloc>()),
      ],
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if(state is ChangeLocaleState){
            locale = state.locale;
          }if(state is ChangeThemeState){
            darkMode = state.darkMode;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: darkMode == true ? ThemeMode.dark : ThemeMode.light,
            locale: locale,
            localizationsDelegates: const [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            // list languages AppLocalizations auto generate
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

