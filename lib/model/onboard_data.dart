class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Save your time',
    image: 'assets/images/save.png',
  ),
  OnBoarding(
    title: 'Create daily plans easily',
    image: 'assets/images/plan.png',
  ),
  OnBoarding(
    title: 'Keep track of your progress',
    image: 'assets/images/progress.png',
  ),
  OnBoarding(
    title: 'Add your favorites',
    image: 'assets/images/wish.png',
  ),
];
