import 'package:flutter/material.dart';
import 'package:newapps/homepage.dart';
import 'package:typewritertext/typewritertext.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 200,
              child: TypeWriter.text(
                'Welcome to Buddy! Where you find awesome hiking companions.',
                style: const TextStyle(
                  color: Color(0xff0202fa),
                  fontWeight: FontWeight.w100,
                  fontSize: 30,
                ),
                duration: const Duration(milliseconds: 100),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff0202fa)),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 18)),
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(
                  stepCountValue: '',
                ),
              ),
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
