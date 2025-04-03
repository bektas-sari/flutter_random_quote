import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const RandomQuoteApp());
}

class RandomQuoteApp extends StatelessWidget {
  const RandomQuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const QuoteScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<String> _quotes = [
    "Believe in yourself!",
    "Never stop learning.",
    "Stay positive, work hard, make it happen.",
    "Dream big and dare to fail.",
    "Do something today that your future self will thank you for.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "Push yourself, because no one else is going to do it for you.",
  ];

  String _currentQuote = "Tap the button to get inspired!";

  void _showRandomQuote() {
    final random = Random();
    setState(() {
      _currentQuote = _quotes[random.nextInt(_quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Quote')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentQuote,
                style: const TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _showRandomQuote,
                child: const Text('Show Another Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
