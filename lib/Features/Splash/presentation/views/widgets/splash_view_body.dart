import 'package:book/Features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:book/core/utils/AppRouter.dart';
import 'package:book/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  late Animation<Offset> SlidingAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    initSlidingAnimation();

    navigateToHome();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.logo,
        ),
        const SizedBox(
          height: 10,
        ),
        Sliding_Text(
          SlidingAnimation: SlidingAnimation,
          AnimatedText: "Read Free Books",
        ),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        GoRouter.of(context).pushReplacement(AppRouter.khomeview);
      },
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    SlidingAnimation = Tween(begin: const Offset(0, 4), end: Offset.zero)
        .animate(animationController);

    animationController.forward();
  }
}
