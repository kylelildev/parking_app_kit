import 'package:flutter/material.dart';
import 'package:parking_app_kit/src/app.dart';
import 'package:provider/provider.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    var selectedLocale = Localizations.localeOf(context).toString();
    // var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<ThemeMode>(
              // Read the selected themeMode from the controller
              value: controller.themeMode,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: controller.updateThemeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            ),
            Consumer<LocaleModel>(
              builder: (context, localeModel, child) => DropdownButton<String>(
                // Read the selected themeMode from the controller
                // Call the updateThemeMode method any time the user selects a theme.
                value: selectedLocale,
                onChanged: (String? value) {
                  if (value != null) {
                    localeModel.set(Locale(value));
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: "en",
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: "vi",
                    child: Text('Tiếng Việt'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
