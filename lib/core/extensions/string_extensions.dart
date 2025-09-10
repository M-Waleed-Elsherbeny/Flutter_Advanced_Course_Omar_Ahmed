extension StringExtensions on String? {
  /// Capitalizes the first letter of the string.
  String capitalize() => "${this![0].toUpperCase()}${this!.substring(1)}";
  /// Returns [true] if the string is null or empty, and [false] otherwise.
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtensions<T> on List<T>? {
  /// Returns [true] if the list is null or empty, and [false] otherwise.
  bool isNullOrEmpty() => this == null || this == [];
}