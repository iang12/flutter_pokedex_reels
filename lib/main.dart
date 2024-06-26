import 'package:flutter/material.dart';
import 'package:flutter_animations_reels/pages/pokemon_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            letterSpacing: 1,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: _isClicked ? Colors.blue : Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _isClicked = !_isClicked;
          });
        },
        child: const Text(
          'Clique-me',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
