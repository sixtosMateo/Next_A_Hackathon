import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nextgen_hackathon/curriculum.dart';
import 'package:nextgen_hackathon/home.dart';
import 'package:nextgen_hackathon/topic.dart';
import 'package:nextgen_hackathon/quiz.dart';
import 'package:nextgen_hackathon/settings.dart';
import 'package:nextgen_hackathon/results.dart';
import 'firebase_options.dart';

void main() async {
  // firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); // Constructor for MyApp class. Key is a unique identifier for the widget.

  @override
  Widget build(BuildContext context) {
    final providers = [
      EmailAuthProvider()
    ]; // List of providers to use for authentication.

    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? '/sign-in'
          : '/home', // If user is not signed in, route to sign-in page. Else, route to chat page.
      title: 'Nextgen Hackathon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // theme data for the app
      ),
      // remove debug flag
      debugShowCheckedModeBanner: false,
      routes: {
        '/sign-in': (context) {
          return SignInScreen(
            providers: providers,
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                // When the user signs in, this callback is called.
                Navigator.pushReplacementNamed(context, '/home');
                // Navigator.pushReplacementNamed(context, '/topic');
                // Navigator.pushReplacementNamed(context, '/quiz');
                // Navigator.pushReplacementNamed(context, '/settings');
              }),
            ],
          );
        },
        '/home': (context) {
          return const HomeScreen();
        },
        '/topic': (context) {
          return const TopicScreen();
        },
        '/curriculum': (context) {
          return const CurriculumScreen();
        },
        '/quiz': (context) {
          return const QuizScreen();
        },
        '/results': (context) {
          return const ResultsScreen();
        },
        '/settings': (context) {
          return const SettingsScreen();
        },
        '/profile': (context) {
          return ProfileScreen(
            providers: providers,
            actions: [
              SignedOutAction((context) {
                Navigator.pushReplacementNamed(context, '/sign-in');
              }),
            ],
          );
        },
      },
    );
  }
}
