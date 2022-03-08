import 'package:flutter/material.dart';
import 'poke_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeSelectionPage extends StatefulWidget {
  const ThemeModeSelectionPage({
    Key key,
    this.mode,
  }) : super(key: key);
  final ThemeMode mode;

  @override
  _ThemeModeSelectionPageState createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState extends State<ThemeModeSelectionPage> {

  ThemeMode _current;
  @override
  void initState() {
    super.initState();
    _current = widget.mode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop<ThemeMode>(context, _current),
              ),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: _current,
              title: const Text('System'),
              onChanged: (val) => {setState(() => _current = val)},
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: _current,
              title: const Text('Dark'),
              onChanged: (val) => {setState(() => _current = val)},
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: _current,
              title: const Text('Light'),
              onChanged: (val) => {setState(() => _current = val)},
            ),
          ],
        ),
      ),
    );
  }
}

int modeToVal(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.system:
      return 1;
    case ThemeMode.dark:
      return 2;
    case ThemeMode.light:
      return 3;
    default:
      return 0;
  }
}

ThemeMode valToMode(int val) {
  switch (val) {
    case 1:
      return ThemeMode.system;
    case 2:
      return ThemeMode.dark;
    case 3:
      return ThemeMode.light;
    default:
      return ThemeMode.system;
  }
}

Future<void> saveThemeMode(ThemeMode mode) async {
  final pref = await SharedPreferences.getInstance();
  pref.setInt('theme_mode', modeToVal(mode));
}

Future<ThemeMode> loadThemeMode() async {
  final pref = await SharedPreferences.getInstance();
  final ret = valToMode(pref.getInt('theme_mode') ?? 0);
  return ret;
}