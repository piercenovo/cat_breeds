class Routes {
  const Routes._({
    required this.name,
    required this.path,
  });
  final String name;
  final String path;

  static Routes get splash => const Routes._(
    name: 'splash',
    path: '/splash',
  );

  static Routes get catBreeds => const Routes._(
    name: 'cat-breeds',
    path: '/cat-breeds',
  );
}
