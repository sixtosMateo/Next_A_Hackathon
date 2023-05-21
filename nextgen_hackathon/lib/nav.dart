import 'package:flutter/material.dart';

class NavWidget extends StatefulWidget {
  const NavWidget({super.key});

  // Navigator.pushReplacementNamed(context, '/sign-in');

  @override
  State<NavWidget> createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> {
  @override
  Widget build(BuildContext context) => navBar(context);

  Widget navBar(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.of(context).pushNamed('/home'),
          ),
          ListTile(
            leading: const Icon(Icons.topic),
            title: const Text('Topic'),
            onTap: () => Navigator.of(context).pushNamed('/topic'),
          ),
          ListTile(
            leading: const Icon(Icons.play_lesson),
            title: const Text('Curriculum'),
            onTap: () => Navigator.of(context).pushNamed('/curriculum'),
          ),
          ListTile(
            leading: const Icon(Icons.quiz),
            title: const Text('Quiz'),
            onTap: () => Navigator.of(context).pushNamed('/quiz'),
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text('Results'),
            onTap: () => Navigator.of(context).pushNamed('/results'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.of(context).pushNamed('/settings'),
          ),
        ],
      ),
    );
  }
}

// class NavBar {
//   Widget navBar(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: <Widget>[
//           ListTile(
//             leading: const Icon(Icons.home),
//             title: const Text('Home'),
//             onTap: () => Navigator.of(context).pushNamed('/home'),
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Topic'),
//             onTap: () {
//               // Update the UI
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Quiz'),
//             onTap: () {
//               // Update the UI
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Results'),
//             onTap: () {
//               // Update the UI
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () {
//               // Update the UI
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
