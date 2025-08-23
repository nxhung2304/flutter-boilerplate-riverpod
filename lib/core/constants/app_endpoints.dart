class AppEndpoints {
  // Example
  static const String examples = '/examples';

  static String getExampleById(int exampleId) => '$examples/$exampleId';
  static String updateExample(int exampleId) => '$examples/$exampleId';
  static String toggleExample(int exampleId) => '$examples/$exampleId/toggle';
  static String deleteExample(int exampleId) => '$examples/$exampleId';
}
