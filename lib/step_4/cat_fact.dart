class CatFact {
  final String fact;
  final int length;

  const CatFact({
    required this.fact,
    required this.length,
  });

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
}
