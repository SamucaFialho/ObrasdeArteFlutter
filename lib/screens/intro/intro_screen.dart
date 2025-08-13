import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:obras_de_arte/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Map<String, String>> _pages = [
    
    
    {
      'title' : 'Bem-vindo ao app',
      'subtitle' : 'Aprenda a usar o app passo a passo',
      'lottie': 'assets/lottie/intro2.json',
    },
    {
      'title' : 'Comece agora',
      'subtitle' : 'Vamos começar a usar o app.',
      'lottie': 'assets/lottie/intro1.json',
    },

  ];

  final PageController _pageController = PageController();

  int _currentPage = 0;

  bool _dontShowAgain = false;

  void _onNext(){
    if(_currentPage < _pages.length -1){
      _pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.easeIn,
      );
    } else{
      _finishIntro();
    }

  void onBack(){
    if(_currentPage < 0){
      _pageController.previousPage(duration: Duration(microseconds: 300), curve: Curves.easeOut);
    }
  void _finishIntro(){
    Navigator.pushReplacementNamed(context, Routes.home);
  }

    }

  }
  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _pages.length -1;
    return const Placeholder();
  }
}