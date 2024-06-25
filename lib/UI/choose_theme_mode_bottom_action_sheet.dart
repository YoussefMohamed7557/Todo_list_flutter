import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/settings_provider.dart';

class ThemeBottomActionSheet extends StatefulWidget {
  const ThemeBottomActionSheet({super.key});

  @override
  State<ThemeBottomActionSheet> createState() => _ThemeBottomActionSheetState();
}

class _ThemeBottomActionSheetState extends State<ThemeBottomActionSheet> {
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    bool isLightCondition = provider.themeMode == ThemeMode.light;
    bool isDarkCondition = provider.themeMode == ThemeMode.dark;
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.sizeOf(context).height / 2,
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  provider.changeThemeMode(ThemeMode.light);
                  Navigator.pop(context);
                },
                child: getThemeRow(AppLocalizations.of(context)!.light_mode,
                    isLightCondition)),
            InkWell(
                onTap: () {
                  provider.changeThemeMode(ThemeMode.dark);
                  Navigator.pop(context);
                },
                child: getThemeRow(
                  AppLocalizations.of(context)!.dark_mode,
                  isDarkCondition,
                ))
          ],
        ),
      ),
    );
  }

  Widget getThemeRow(String themeMode, bool isSelected) {
    if (isSelected) {
      return getSelectedThemeRow(themeMode);
    } else {
      return getUnSelectedThemeRow(themeMode);
    }
  }

  Widget getSelectedThemeRow(String themeMode) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            themeMode,
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

  Widget getUnSelectedThemeRow(String themeMode) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            themeMode,
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
