import 'package:flutter/material.dart';
import 'homepage.dart';

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
                // Убрали жесткую высоту (height: 550), чтобы плашка сама растягивалась
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20), 
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min, // Указываем колонке занимать только нужную высоту
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Thank you for choosing to dine here.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 65,
                        fontWeight: FontWeight.w400,
                        
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: 700, // <-- Раньше тут было 500, уравняли с нижней частью
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Seat number',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                            ),
                          ),

                          const SizedBox(height: 10),

                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: 700,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Number of diner(s)',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(160, 50),
                                  textStyle: const TextStyle(fontSize: 24),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text('1'),
                              ),

                              ElevatedButton(
                                onPressed: () {
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(160, 50),
                                  textStyle: const TextStyle(fontSize: 24),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text('2'),
                              ),

                              ElevatedButton(
                                onPressed: () {
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(160, 50),
                                  textStyle: const TextStyle(fontSize: 24),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text('3'),
                              ),

                              ElevatedButton(
                                onPressed: () {
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(160, 50),
                                  textStyle: const TextStyle(fontSize: 24),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text('4'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    SizedBox(
                      width: 300,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.orange,
                          textStyle: const TextStyle(fontSize: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
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