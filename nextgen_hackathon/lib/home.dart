import 'package:flutter/material.dart';
import 'package:nextgen_hackathon/chat.dart';
import 'package:nextgen_hackathon/nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        drawer: const NavWidget(),
        body: Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: const ChatWidget(),
        ),
      ),
    );
  }
}
