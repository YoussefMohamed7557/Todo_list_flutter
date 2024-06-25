import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/settings_provider.dart';

class LanguageBottomActionSheet extends StatefulWidget {
  const LanguageBottomActionSheet({super.key});

  @override
  State<LanguageBottomActionSheet> createState() =>
      _LanguageBottomActionSheetState();
}

class _LanguageBottomActionSheetState extends State<LanguageBottomActionSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    bool isArabicCondition = provider.language_code == "ar";
    bool isEnglishCondition = provider.language_code == "en";
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.sizeOf(context).height / 2,
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  provider.changeLanguageCode("ar");
                  Navigator.pop(context);
                },
                child: getRowOfLanguage(AppLocalizations.of(context)!.arabic, isArabicCondition)),
            InkWell(onTap:() {
              provider.changeLanguageCode("en");
              Navigator.pop(context);
            } ,child: getRowOfLanguage(AppLocalizations.of(context)!.english, isEnglishCondition)),
          ],
        ),
      ),
    );
  }

  Widget getRowOfLanguage(String language, bool isSelected) {
    if (isSelected) {
      return getRowOfSelectedLanguage(language);
    } else {
      return getRowOfUnSelectedLanguage(language);
    }
  }

  Widget getRowOfSelectedLanguage(String language) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor),
          ),
          Icon(
            Icons.check,
            size: 32,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  Widget getRowOfUnSelectedLanguage(String language) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
