class CatFact {
  final String fact;
  final int length;

//<editor-fold desc="Data Methods">

  const CatFact({
    required this.fact,
    required this.length,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatFact && runtimeType == other.runtimeType && fact == other.fact && length == other.length);

  @override
  int get hashCode => fact.hashCode ^ length.hashCode;

  @override
  String toString() {
    return 'CatFact{' + ' fact: $fact,' + ' length: $length,' + '}';
  }

  CatFact copyWith({
    String? fact,
    int? length,
  }) {
    return CatFact(
      fact: fact ?? this.fact,
      length: length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fact': this.fact,
      'length': this.length,
    };
  }

  factory CatFact.fromMap(Map<String, dynamic> map) {
    return CatFact(
      fact: map['fact'] as String,
      length: map['length'] as int,
    );
  }

//</editor-fold>
}
