import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/RACLETTE.jpg'), fit: BoxFit.cover),
        ),
      ),
        child: Center(
          child: Container(
            width: 600,
            height: 400,
            padding: const EdgeInsets.all(32),

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),

            child: const Center(
              child: Text(
                'Текст',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          ),
        ),
    );
  }
}