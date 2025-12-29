class TTexts {
  const TTexts._();

  static const String appName = 'CoinTrail';

  static const String login = 'Login';
  static const String signUp = 'Sign Up';

  static const String welcome = 'Welcome';
  static const String continueText = 'Continue';

  // Radius TSplashTokens
  static const double floodRadiusThreshold = 400;
  static const double initialCurveOffset = 50;
  static const double curveDepth = 20;

  // Curve TSplashTokens
  static const double curveControlLeft = 0.25;
  static const double curveControlRight = 0.75;

  // Positioning TSplashTokens
  static const double circleCenterFactor = 0.5;

  // Durations
  static const int totalDurationMs = 4500;

  // Circle
  static const double initialRadius = 50;
  static const double expandedRadius = 100;
  static const double floodRadius = 500;

  // Positions
  static const double dropEnd = 0.7;
  static const double center = 0.5;

  // Bottom contraction
  static const double contractionStart = 0.70;
  static const double contractionEnd = 1.0;
  static const double minContraction = 0.8;
}
