import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../commons/utility/locale_util.dart';
import '../../../commons/utility/theme_ulti.dart';

part 'main_bloc_state.dart';

class MainBloc extends Cubit<MainState> {
  final SharedPreferences sharedPreferences;
  final LocaleHelper localeHelper;
  final ThemeHelper themeHelper;

  MainBloc({
    required this.sharedPreferences,
    required this.localeHelper,
    required this.themeHelper,
  }) : super(MainBlocInitial()){
    getLocalLocale();
    getLocalTheme();
  }

  Locale? locale;
  bool? darkMode;

  getLocalLocale(){
    locale = localeHelper.getLocaleLocal();
    emit(ChangeLocaleState(locale));
  }

  changeLocale(String languageCode) async{
    Locale locale = await localeHelper.setLocaleLocal(languageCode);
    emit(ChangeLocaleState(locale));
  }

  getLocalTheme(){
    darkMode = themeHelper.getLocaleLocal();
    emit(ChangeThemeState(darkMode));
  }

  changeTheme(bool darkMode) async{
    await themeHelper.setThemeLocal(darkMode);
    emit(ChangeThemeState(darkMode));
  }
}
