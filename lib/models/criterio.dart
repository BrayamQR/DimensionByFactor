class Criterio {
  final int id;
  final String criterio;
  final int idstandard;
  bool ischecked;

  Criterio({
    required this.id,
    required this.criterio,
    required this.idstandard,
    this.ischecked = false,
  });
}
