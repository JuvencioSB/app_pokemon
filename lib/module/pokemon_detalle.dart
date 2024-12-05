class Info_pokemo {
  String nombre;
  String imagen;
  List<Type> tipos;
  Info_pokemo(
      {required this.nombre, required this.imagen, required this.tipos});

  factory Info_pokemo.fromJson(dynamic json) {
    print(json.data['name']);
    print(json.data['sprites']["other"]["dream_world"]["front_default"]);
    List<Type> Temp_Tipos = [];
    for (var element in json.data["types"]) {
      Temp_Tipos.add(Type.obtener(element));
      print(element["type"]["name"].toString());
    }
    return Info_pokemo(
        imagen: json.data['sprites']["other"]["official-artwork"]
            ["front_default"],
        nombre: json.data['name'],
        tipos: Temp_Tipos);
  }

  Future<Map<String, dynamic>> toJson() async {
    return {'nombre': nombre, 'imagen': imagen, 'tipos': tipos};
  }
}

class Type {
  String tipo;
  Type(this.tipo);

  factory Type.obtener(dynamic data) {
    return Type(data["type"]["name"].toString());
  }
}
