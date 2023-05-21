import 'package:flutter/material.dart';
import 'package:nextgen_hackathon/nav.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculum'),
      ),
      drawer: const NavWidget(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget('Binary Search', """
1.) Introduction to Binary Search
 - Watch a video explaining the basic concept of binary search, its advantages, and use cases.
 - Read a comprehensive overview of binary search, including its algorithmic steps and complexity analysis.
 - Understanding the Binary Search Algorithm

2.) Watch a video that demonstrates how binary search works step-by-step, using visual aids and animations.
 - Read a detailed explanation of the algorithm, including pseudocode and key considerations.
 - Real-life Applications of Binary Search

3.) Explore practical examples where binary search is commonly used, such as searching in a phonebook, finding a word in a dictionary, or locating an item in a sorted array.
 - Implementing Binary Search in Programming

4.) Watch a coding tutorial video that walks you through the implementation of binary search in a programming language of your choice.
 - Practice implementing binary search on your own, using coding exercises with increasing complexity.
 - Analyzing Time and Space Complexity

5.) Study the time and space complexity analysis of the binary search algorithm.
 - Understand the advantages of binary search compared to linear search in terms of efficiency."""),
            // SizedBox(height: 16), // Add spacing between the buttons
            // ButtonWidget('Button 2', 'Text for Button 2'),
            // SizedBox(height: 16), // Add spacing between the buttons
            // ButtonWidget('Button 3', 'Text for Button 3'),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final String popupText;

  const ButtonWidget(this.buttonText, this.popupText, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(buttonText, style: const TextStyle(fontSize: 28)),
              content: Text(popupText, style: const TextStyle(fontSize: 22)),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Take Test'),
                ),
              ],
            );
          },
        );
      },
      child: Text(buttonText,
          style: const TextStyle(fontSize: 20)), // Increase the font size),
    );
  }
}


  // @override
  // Widget build(BuildContext context) {
  //   return Material(
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('My App'),
  //       ),
  //       drawer: const NavWidget(),
  //       body: Container(
  //         color: Theme.of(context).colorScheme.secondaryContainer,
  //         // child: const ChatWidget(),
  //       ),
  //     ),
  //   );
  // }
// }
