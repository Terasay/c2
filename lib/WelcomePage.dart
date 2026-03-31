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
          image: DecorationImage(
            image: AssetImage('assets/images/RACLETTE.jpg'), 
            fit: BoxFit.cover
          ),
        ),

        child: Stack(
          children: [
            Center(
              child: Container(
                width: 850,
                height: 550,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(height: 40),

                    Text(
                      'Thank you for choosing to dine here.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 72,
                        fontWeight: FontWeight.w400,
                        
                      ),
                    ),
                  ],
                ),
              ),
            ),


            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/images/logo.png', 
                  width: 140, 
                  height: 140,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}