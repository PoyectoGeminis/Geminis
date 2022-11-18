class Sites{

  var _id;
  var _ciudad;
  var _departamento;
  var _descripcion;
  var _latitud;
  var _longitud;
  var _nombre;
  var _temperatura;
  var _urlPicture;

  Sites();

  get id => _id;

  set id(value) {
    _id = value;
  }

  get ciudad => _ciudad;

  get urlPicture => _urlPicture;

  set urlPicture(value) {
    _urlPicture = value;
  }

  get temperatura => _temperatura;

  set temperatura(value) {
    _temperatura = value;
  }

  get nombre => _nombre;

  set nombre(value) {
    _nombre = value;
  }

  get longitud => _longitud;

  set longitud(value) {
    _longitud = value;
  }

  get latitud => _latitud;

  set latitud(value) {
    _latitud = value;
  }

  get descripcion => _descripcion;

  set descripcion(value) {
    _descripcion = value;
  }

  get departamento => _departamento;

  set departamento(value) {
    _departamento = value;
  }

  set ciudad(value) {
    _ciudad = value;
  }
}