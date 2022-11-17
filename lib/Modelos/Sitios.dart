class Sitio {
  var _id;
  var _name;
  var _departamento;
  var _ciudad;
  var _temperatura;
  var _descripcion;
  var _rating;


  Sitio(this._id, this._name,this._departamento, this._ciudad, this._temperatura,
      this._descripcion, this._rating);


  Map<String, dynamic> toJson() => {
    "id" : _id,
    "nombre" : _name,
    "departamento" : _departamento,
    "ciudad" : _ciudad,
    "Temperatura" : _temperatura,
    "descripcion" : _descripcion,
    "rating" : _rating
  };



  Sitio.fromJson(Map<String, dynamic> json)
      : _id = json["id"],
        _name = json["nombre"],
        _departamento = json["departamento"],
        _ciudad = json["ciudad"],
        _temperatura = json["temperatura"],
        _descripcion = json["descripcion"],
        _rating = json["rating"];

  get id => _id;

  set id(value) {
    _id = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }

  get descripcion => _descripcion;

  set descripcion(value) {
    _descripcion = value;
  }

  get temperatura => _temperatura;

  set temperatura(value) {
    _temperatura = value;
  }

  get ciudad => _ciudad;

  set ciudad(value) {
    _ciudad = value;
  }

  get departamento => _departamento;

  set departamento(value) {
    _departamento = value;
  }
}