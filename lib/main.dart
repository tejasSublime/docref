import 'package:docref/screens/loginscreen/loginscreen.dart';
import 'package:docref/themes/def_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'DocRef',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                toolbarHeight: 140,
                titleTextStyle: TextStyle(color: primaryLight),
                elevation: 0,
                scrolledUnderElevation: 0
                //     leading: null,
                // flexibleSpace: Container(
                //   decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: <Color>[
                //  Color.fromRGBO(83, 155, 167, 1),
                //       Color.fromRGBO(255, 255, 255, 1)
                //         ]),
                //   ),
                // ),
                ),
            fontFamily: "Avenir",
            primaryColor: primaryLight,
            primaryColorLight: secondaryLight,
            colorScheme: ColorScheme.fromSeed(seedColor: primaryLight),
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white),
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
