import 'package:anime_app/Database/local_database.dart';
import 'package:anime_app/models/webtoon.dart';
import 'package:anime_app/providers/dummy_data.dart';
import 'package:anime_app/router/app_routes.dart';
import 'package:anime_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<Webtoon> initialData;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('isDataInitialized') == null ||
      prefs.getBool('isDataInitialized') == false) {
    await for (var item in Stream.fromIterable(dummyWebtoons)) {
      LocalDatabaseHelper.insertData('webtoons', item);
    }
  }
  prefs.setBool('isDataInitialized', true);
  initialData = await LocalDatabaseHelper.getData('webtoons')
      .then((value) => value.map((e) => Webtoon.fromJson(e)).toList());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Anime App',
      theme: AppTheme.instance.theme,
      routerConfig: AppRoutes.instance.router,
    );
  }
}
