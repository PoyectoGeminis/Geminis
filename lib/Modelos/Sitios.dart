class Sitio {
  var _id;
  var _name;
  var _photo;
  var _ciudad;
  var _departamento;
  var _descripcion;
  var _temperatura;
  var _rating;


  Sitio(this._id, this._name,this._photo,this._ciudad, this._departamento, this._descripcion,
      this._temperatura, this._rating);


  Map<String, dynamic> toJson() => {
    "id" : _id,
    "nombre" : _name,
    "photo" : _photo,
    "ciudad" : _ciudad,
    "departamento" : _departamento,
    "descripcion" : _descripcion,
    "Temperatura" : _temperatura,
    "rating" : _rating
  };



  Sitio.fromJson(Map<String, dynamic> json)
      : _id = json["id"],
        _name = json["nombre"],
        _photo = json["photo"],
        _ciudad = json["ciudad"],
        _departamento = json["departamento"],
        _descripcion = json["descripcion"],
        _temperatura = json["temperatura"],
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

  get photo => _photo;

  set photo(value) {
    _photo = value;
  }

  get departamento => _departamento;

  set departamento(value) {
    _departamento = value;
  }

  get ciudad => _ciudad;

  set ciudad(value) {
    _ciudad = value;
  }

}

