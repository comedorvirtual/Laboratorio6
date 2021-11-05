import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Historial{
  String? _id;
  String _peso="";
  String _talla="";

  Historial(this._id, this._peso, this._talla);

  Historial.map(dynamic obj){
    this._peso = obj['peso'];
    this._talla = obj['talla'];
  }

  String? get id => _id;
  String get peso => _peso;
  String get talla => _talla;

  Historial.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _peso = snapshot.value['peso'];
    _talla = snapshot.value['talla'];
  }

}