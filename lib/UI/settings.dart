import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_flutter/UI/choose_language_bottom_action_sheet.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_flutter/models/settings_provider.dart';
import 'choose_theme_mode_bottom_action_sheet.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    String selectedLanguage = provider.language_code=="en"?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic;
    String selectedThemeMode = provider.themeMode==ThemeMode.light?AppLocalizations.of(context)!.light_mode:AppLocalizations.of(context)!.dark_mode;
    return Column(
      children: [
        Container(height: 80,color: Theme.of(context).primaryColor,),
        Spacer(),
        Padding(padding: EdgeInsets.all(16.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.displayMedium?.copyWith(color:Colors.black87),),
            InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedLanguage, style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color:Colors.black87),),
                    Icon(Icons.arrow_drop_down_circle_outlined,size: 28,color: Colors.black54,)
                  ],
                ),

                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(12),border: Border.all(color:Colors.black87)),
              ),
            ),
            Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.displayMedium?.copyWith(color:Colors.black87),),
            InkWell(
              onTap: (){
                showThemeBottomSheet();
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedThemeMode, style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.black87),),
                    Icon(Icons.arrow_drop_down_circle_outlined,size: 30,color: Colors.black54,)
                  ],
                ),
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(12),border: Border.all(color: Colors.black87)),
              ),
            )
          ],
        ), ),
        Spacer(flex: 3,),
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) => LanguageBottomActionSheet(),);
  }
  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) => ThemeBottomActionSheet(),);
  }
}
