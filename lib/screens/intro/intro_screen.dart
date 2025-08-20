import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:obras_de_arte/data/settings_repository.dart';
import 'package:obras_de_arte/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  SettingsRepository? _settingsRepository;
  @override
  void initState() {
    super.initState();
    _initRepository();
  }

  Future<void> _initRepository() async {
    final repo = await SettingsRepository.create();
    setState(() {
      _settingsRepository = repo;
    });
  }

  final List<Map<String, String>> _pages = [
    {
      'title': 'Bem-vindo ao app',
      'subtitle': 'Aprenda a usar o app passo a passo',
      'lottie': 'assets/lottie/intro2.json',
    },
    {
      'title': 'Comece agora',
      'subtitle': 'Vamos começar a usar o app.',
      'lottie': 'assets/lottie/intro1.json',
    },
  ];

  Future<void> _finishIntro() async {
    await _settingsRepository?.setShowIntro(!_dontShowAgain);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  final PageController _pageController = PageController();

  int _currentPage = 0;

  bool _dontShowAgain = false;

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(microseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _finishIntro();
    }

    void onBack() {
      if (_currentPage < 0) {
        _pageController.previousPage(
          duration: Duration(microseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _pages.length - 1;
    return const Placeholder();
  }
}
