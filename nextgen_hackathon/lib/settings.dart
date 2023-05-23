import 'package:flutter/material.dart';
import 'package:nextgen_hackathon/nav.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const NavWidget(),
        body: Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          // child: const ChatWidget(),
        ),
      ),
    );
  }
}
