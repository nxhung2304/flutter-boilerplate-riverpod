class AppRoutes {
  static String home = '/home';

  static String example = '/example';
  static String newExample = '/example/new';
  static String editExample = '/example/edit/:exampleId';

  // Helper
  static String editExamplePath(int exampleId) => '/example/edit/$exampleId';
}
