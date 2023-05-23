
import 'package:flutter/material.dart';
import 'package:nextgen_hackathon/nav.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symbols Page'),
      ),
      drawer: const NavWidget(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SymbolWidget(
                symbol: Icons.done,
                label: 'Binary Search Concepts',
                color: Colors.green,
              ),
              SizedBox(height: 16),
              SymbolWidget(
                  symbol: Icons.close,
                  label: 'Binary Search Real-Life Applications',
                  color: Colors.red),
              SizedBox(height: 16),
              SymbolWidget(
                symbol: Icons.done,
                label: 'Binary Search Runtime Analysis',
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SymbolWidget extends StatelessWidget {
  final IconData symbol;
  final String label;
  final Color color;

  const SymbolWidget(
      {super.key, required this.symbol, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          symbol,
          size: 32,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
