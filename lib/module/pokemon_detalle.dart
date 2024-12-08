import 'package:floor/floor.dart';

@Entity(tableName: 'info_pokemo')
class Info_pokemo {
  @PrimaryKey()
  String nombre;
  String imagen;
  @ignore
  List<Type> tipos = [];
  Info_pokemo(
      {required this.nombre, required this.imagen, required this.tipos});

  factory Info_pokemo.fromJson(dynamic json) {
    //print(json.data['name']);
    //print(json.data['sprites']["other"]["dream_world"]["front_default"]);
    List<Type> Temp_Tipos = [];
    for (var element in json.data["types"]) {
      Temp_Tipos.add(Type.obtener(element, json.data["name"]));
      //print(element["type"]["name"].toString());
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

@Entity(tableName: 'type')
class Type {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  String pokemon;
  String tipo;
  Type(this.id, this.tipo, this.pokemon);

  factory Type.obtener(dynamic data, dynamic pokemon) {
    return Type(null, data["type"]["name"].toString(), pokemon.toString());
  }
  Future<Map<String, dynamic>> toJson() async {
    return {'nombre': pokemon, 'type': tipo};
  }
}
