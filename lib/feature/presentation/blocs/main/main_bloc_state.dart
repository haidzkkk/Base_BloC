part of 'main_bloc_cubit.dart';

@immutable
sealed class MainState extends Equatable {}

final class MainBlocInitial extends MainState {
  @override
  List<Object?> get props => [];
}

final class ChangeLocaleState extends MainState {
  final Locale? locale;

  ChangeLocaleState(this.locale);

  @override
  List<Object?> get props => [locale];
}


final class ChangeThemeState extends MainState {
  final bool? darkMode;

  ChangeThemeState(this.darkMode);

  @override
  List<Object?> get props => [darkMode];
}
