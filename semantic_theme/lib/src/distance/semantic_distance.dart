abstract class SemanticDistance {
  /// Between objects that should be practically touching
  double get min;

  /// Between objects that should be close, but easily differentiable
  double get small;

  /// Between somewhat prominent objects or sections
  double get medium;

  /// Between extremely prominent objects or sections
  double get large;

  /// Maximum visual separation
  double get max;
}
