import 'package:flutter/material.dart';
import 'package:nextgen_hackathon/nav.dart';

import 'package:nextgen_hackathon/curriculum.dart';
import 'package:nextgen_hackathon/home.dart';
import 'package:nextgen_hackathon/topic.dart';
import 'package:nextgen_hackathon/settings.dart';
import 'package:nextgen_hackathon/results.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const QuestionPage(), routes: {
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
    });
  }
}

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Question> questions = [
    Question(
        'Question 1: Which of the following best describes the purpose of binary search?',
        [
          'a) Sorting a list of elements in ascending order',
          'b) Finding the median element in a list',
          'c) Searching for a target element in a sorted list efficiently',
          'd) Reversing the order of elements in a list'
        ],
        'c) Searching for a target element in a sorted list efficiently'),
    Question(
        'Question 2: What is the key requirement for binary search to work correctly?',
        [
          'a) The list must be sorted in descending order.',
          'b) The list must contain only unique elements.',
          'c) The list must be sorted in ascending order.',
          'd) The list must have an odd number of elements.'
        ],
        'c) The list must be sorted in ascending order.'),
    Question(
        'Question 3: During each iteration of the binary search algorithm, the search range is effectively halved. What is the time complexity of binary search in the worst case?',
        ['a) O(1)', 'b) O(log n)', 'c) O(n)', 'd) O(n^2)'],
        'b) O(log n)'),
    Question(
        'Question 4: In binary search, if the target element is not found in the list, what value is typically returned?',
        ['a) -1', 'b) 0', 'c) null', 'd) None of the above'],
        'a) -1'),
    Question(
        'Question 5: Which of the following scenarios is binary search well-suited for?',
        [
          'a) Searching for an element in an unsorted list',
          'b) Finding the maximum element in a list',
          'c) Searching for a word in a dictionary',
          'd) Sorting a list of elements'
        ],
        'c) Searching for a word in a dictionary'),
  ];

  int currentQuestionIndex = 0;
  String selectedAnswer = "";
  bool isAnswerCorrect = false;

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      isAnswerCorrect = answer == questions[currentQuestionIndex].correctAnswer;
    });
  }

  void nextQuestion() {
    setState(() {
      selectedAnswer = "";
      isAnswerCorrect = false;
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // If all questions have been answered, show a dialog or navigate to a new page
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Congratulations!'),
              content: const Text('You have answered all the questions.'),
              actions: [
                // SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // SizedBox(height: 16);
    Question currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz: Binary Search'),
      ),
      drawer: const NavWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.question,
                style: const TextStyle(fontSize: 28),
              ),
              // SizedBox(height: 16),
              Column(
                children: currentQuestion.options.map((option) {
                  return ElevatedButton(
                    onPressed: () => checkAnswer(option),
                    child: Text(option),
                  );
                }).toList(),
              ),
              // SizedBox(height: 16),
              if (selectedAnswer != "")
                Text(
                  isAnswerCorrect
                      ? 'Correct answer!'
                      : 'Wrong answer. Try again!',
                  style: TextStyle(
                    fontSize: 24,
                    color: isAnswerCorrect ? Colors.green : Colors.red,
                  ),
                ),
              const SizedBox(height: 16),
              if (isAnswerCorrect)
                ElevatedButton(
                  onPressed: nextQuestion,
                  child: const Text('Next Question'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
