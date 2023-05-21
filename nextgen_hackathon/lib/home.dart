import 'package:flutter/material.dart';
import 'package:nextgen_hackathon/chat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
  child: Scaffold(
    appBar: AppBar(
      title: const Text('My App'),
    ),
    drawer: Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Update the UI
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Update the UI
            },
          ),
        ],
      ),
    ),
    body: Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: const ChatWidget(),
    ),
  ),
);
  }
}