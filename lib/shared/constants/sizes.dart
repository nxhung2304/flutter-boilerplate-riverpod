enum FontType { title, body }

enum PaddingType { small, medium }

class Sizes {
  static const Map<FontType, Map<String, double>> font = {
    FontType.title: {'mobile': 20.0, 'tablet': 24.0, 'desktop': 28.0},
    FontType.body: {'mobile': 14.0, 'tablet': 16.0, 'desktop': 18.0},
  };
  static const Map<PaddingType, Map<String, double>> padding = {
    PaddingType.small: {'mobile': 8.0, 'tablet': 12.0, 'desktop': 16.0},
    PaddingType.medium: {'mobile': 16.0, 'tablet': 20.0, 'desktop': 24.0},
  };
}
