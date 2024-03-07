import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guess_flag/theme/theme_constants.dart';
import 'package:guess_flag/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';
import 'ResultScreen.dart';
import 'theme/theme_manager.dart';
////////////////////////////lan
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/languages',
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}

//////////// var for dark mode
ThemeManager _themeManager = ThemeManager();

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //////////////////////// Dark mode
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }
  ///////////////////////
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<LanguagesModel>(
    //     create: (_) => LanguagesModel(),
    //     child: Consumer<LanguagesModel>(builder: (context, model, child) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      darkTheme: lightTheme,
      themeMode: _themeManager.themeMode,
      home: QuizScreen(),
      routes: {
        'homeScreen': (context) => QuizScreen(),
      },
    );
    // }
    // ));
  }
}

class QuizScreen extends StatefulWidget {
  QuizScreen();

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //////////////////////// Dark mode

  ///////////////////////
  List<String> countries = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Monaco",
    "Nigeria",
    "Poland",
    "Russia",
    "Spain",
    "United Kingdom",
    "United States",
    "Algeria",
    "Argentina",
    "Bahrain",
    "Brazil",
    "Canada",
    "Denmark",
    "Egypt",
    "Iraq",
    "Mexico",
    "Qatar",
    "Somalia",
    "Sweden",
    "Tunisia",
    "Turkey",
    "Yemen",
    "Lebanon",
    "China",
  ];

  int num = Random().nextInt(3);
  int correctAnswer = 0;
  int wrongAnswer = 0;

  @override
  void initState() {
    super.initState();
    countries.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text(""),
          actions: [
            Switch(
                value: _themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  _themeManager.toggleTheme(newValue);
                }),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Container(
                          height: 150,
                          child: Column(
                            children: [
                              Text(
                                "Select Your Language",
                                style: Theme.of(context).textTheme.subtitle2,
                                // style: TextStyle(
                                //   fontSize: 17,
                                //   color: Colors.black,
                                // ),
                              ).tr(),
                              SizedBox(height: 10),
                              TextButton(
                                  onPressed: () async {
                                    await context.setLocale(Locale('ar'));
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Arabic",
                                    // style: TextStyle(
                                    //   fontSize: 17,
                                    //   color: Colors.teal,
                                    // ),
                                  ).tr()),
                              TextButton(
                                  onPressed: () async {
                                    await context.setLocale(Locale('en'));
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "English",
                                  ).tr()),
                            ],
                          ),
                        ),
                      ));
                },
                icon: Icon(Icons.language)),
          ]),
      //backgroundColor: Color.fromRGBO(74, 138, 148, 10),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 25),
              Text(
                "Guess The Flag?",
                //"Guess The Flag?",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ).tr(),
              Text(
                countries[num],
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ).tr(),
              // SizedBox(height: 20),
              for (int i = 0; i < 3; i++)
                FlagButton(
                    name: countries[i],
                    onPressed: () {
                      if (num == i) {
                        Fluttertoast.showToast(
                            msg: "Correct Answer ✅",
                            backgroundColor: Colors.green);
                        correctAnswer++;
                      } else {
                        Fluttertoast.showToast(
                            msg: "Wrong Answer❕",
                            backgroundColor: Colors.red);
                        wrongAnswer++;
                      }
                      setState(() {
                        countries.shuffle();
                        num = Random().nextInt(3);
                      });
                    }),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                              correctAnswer: correctAnswer,
                              wrongAnswer: wrongAnswer),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    //  primary: Color.fromRGBO(74, 138, 148, 4), // Background color
                    elevation: 10,
                    shadowColor: Colors.black,
                  ),
                  child: Text(
                    "Results",
                    style: TextStyle(fontSize: 20),
                  ).tr())
            ],
          ),
        ),
      ),
    );
  }
}

class FlagButton extends StatelessWidget {
  const FlagButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Image.asset("assets/countries/$name.png",
            width: 350,
            fit: BoxFit.cover,
            height: 150));
  }
}
