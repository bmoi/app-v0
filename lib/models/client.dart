class Client {
  final String id;
  final String nombres;
  final String primerApellido;
  final String segundoApellido;
  final String email;
  final String telefono;
  final String sexo;
  final DateTime fechaNacimiento;
  final String tipoDocumento;
  final String numeroDocumento;
  final String foto;

  Client({
    required this.id,
    required this.nombres,
    required this.primerApellido,
    required this.segundoApellido,
    required this.email,
    required this.telefono,
    required this.sexo,
    required this.fechaNacimiento,
    required this.tipoDocumento,
    required this.numeroDocumento,
    required this.foto,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombres': nombres,
      'primer_apellido': primerApellido,
      'segundo_apellido': segundoApellido,
      'email': email,
      'telefono': telefono,
      'sexo': sexo,
      'fecha_nacimiento': fechaNacimiento.toIso8601String(),
      'tipo_documento': tipoDocumento,
      'numero_documento': numeroDocumento,
      'foto': foto,
    };
  }

}