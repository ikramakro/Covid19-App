import 'package:api_boilerplate/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      pages: [
        PageViewModel(
            title: 'Covid 19 Symptoms ',
            body: '''1)Muscle or body aches  
2) difficulty breathing 
3) Fever or chills
4) Headache 
5) Fatigue
6) Cough''',
            image: Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_66hoasot.json')),
        PageViewModel(
            title: 'Protecting yourself while caring for someone with COVID-19',
            bodyWidget: const Text(
              '''Avoid direct contact with the sick person's fluids...
Keep your hands clean...Clean your home often.
Wear a face mask.
              ''',
            ),
            image: Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_rhxi4oyk.json'))
      ],
      showNextButton: true,
      showDoneButton: true,
      showBackButton: true,
      back: const Text('Back'),
      done: const Text('Done'),
      onDone: () {
        Navigator.pushNamed(context, RoutesName.login);
      },
      next: const Text('Next'),
    );
  }
}
