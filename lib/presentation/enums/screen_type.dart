enum ScreenType {
  left(
    title: 'Screen 1',
    message: 'Swipe right to chat',
    icon: 'arrow_forward',
  ),
  right(
    title: 'Screen 3',
    message: 'Swipe left to chat',
    icon: 'arrow_back',
  );

  final String title;
  final String message;
  final String icon;

  const ScreenType({
    required this.title,
    required this.message,
    required this.icon,
  });
}
