import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Paciente {

  Paciente  (this._id, this._nombre, this._fechaNacimiento, this._estatura,
      this._ubicacion);

  String? _id;
  String _nombre="";
  String _fechaNacimiento="";
  String _estatura="";
  String _ubicacion="";

  Paciente.map(dynamic obj){
    this._nombre = obj['nombre'];
    this._fechaNacimiento = obj['fechaNacimiento'];
    this._estatura = obj['estatura'];
    this._ubicacion = obj['ubicacion'];
  }

  String? get id => _id;
  String get nombre => _nombre;
  String get fechaNacimiento => _fechaNacimiento;
  String get estatura => _estatura;
  String get ubicacion => _ubicacion;

  Paciente.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _fechaNacimiento = snapshot.value['fechaNacimiento'];
    _estatura = snapshot.value['estatura'];
    _ubicacion = snapshot.value['ubicacion'];
  }
}