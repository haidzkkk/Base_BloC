
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocaleUtil on BuildContext{
  AppLocalizations get locale {
    AppLocalizations? appLocalizations = AppLocalizations.of(this);
    if(appLocalizations == null) throw Exception("Locale is request before Localization initalized");

    return appLocalizations;
  }
}