import 'package:flutter/material.dart';
import 'package:nextgen_hackathon/chat.dart';
import 'package:nextgen_hackathon/nav.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Topic'),
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
