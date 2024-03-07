import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({required this.correctAnswer, required this.wrongAnswer});
  final int correctAnswer;
  final int wrongAnswer;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  //////////////////////// Dark mode
  bool _iconBool = false;
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.teal,
    brightness: Brightness.light,
  );
  ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.teal,
    brightness: Brightness.dark,
  );

  ///////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
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
                                ),
                                SizedBox(height: 10),
                                TextButton(
                                    onPressed: () async {
                                      await context.setLocale(Locale('ar'));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Arabic",
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

        ],
        //////////////////////////////////////////////////////////////////////////////\\
      ),
      //   body: AllConfettiWidget(
      // key: null,
      //child:Center(
      //child: Column(
      // body:Center(
      body: Column(
        children: [
          Image(
            image: AssetImage("assets/images/quizResult2.png"),
          ),
          if (widget.correctAnswer > widget.wrongAnswer)
            Text(
              "Congratulations!",
              style: Theme.of(context).textTheme.headline1,
            ).tr()
          else if (widget.correctAnswer < widget.wrongAnswer)
            Text(
              "Hard luck",
              style: Theme.of(context).textTheme.headline1,
            ).tr()
          else if (widget.correctAnswer == 0 && widget.wrongAnswer == 0)
            Text(
              "Oops!",
              style: Theme.of(context).textTheme.headline1,
            ).tr()
          else
            Text(
              "Amazing!",
              style: Theme.of(context).textTheme.headline1,
            ).tr(),
          SizedBox(height: 12),
          Text(
            "Your Score",
            style: Theme.of(context).textTheme.headline2,
            // style: TextStyle(
            //   fontSize: 25,
            //  // color: Colors.black38,
            // ),
          ).tr(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Correct Answers : ",
                style: Theme.of(context).textTheme.bodyText2,
                // style: TextStyle(
                //   fontSize: 24,
                //   color: Colors.green[300],
                // ),
              ).tr(),
              Text(
                //arabicNumber.convert(language.translations["${widget.correctAnswer}"].toString()),
                "${widget.correctAnswer}",
                style: Theme.of(context).textTheme.bodyText2,
                //": ${widget.wrongAnswer}",
                // style: TextStyle(
                //   fontSize: 24,
                //   color: Colors.green[300],
                // ),
              ).tr(),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wrong Answers : ",
                style: Theme.of(context).textTheme.subtitle1,
                // style: TextStyle(
                //   fontSize: 24,
                //   color: Colors.red[300],
                // ),
              ).tr(),
              Text(
                "${widget.wrongAnswer}",
                style: Theme.of(context).textTheme.subtitle1,
                //": ${widget.correctAnswer}",
                // style: TextStyle(
                //   fontSize: 24,
                //   color: Colors.red[300],
                // ),
              ).tr(),
            ],
          ),
          SizedBox(height: 55),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('homeScreen');
                // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen());
              },
              style: ElevatedButton.styleFrom(
                // primary: Color.fromRGBO(74, 138, 148, 4), // Background color
                elevation: 10,
                shadowColor: Colors.black,
              ),
              child: Text(
                "Play Again",
                style: TextStyle(fontSize: 20),
              ).tr()),
        ],
      ),
      //  ),
    );
  }
}
