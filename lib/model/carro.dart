import 'package:flutter/material.dart';

class Carro {
  // String placa = "";
  String cor = "";
  // String ano = "";

  final String _placa;
  final int _ano;

  // Curso(this._nome, this._cargaHoraria);
  // String get nome => _nome;
  // int get cargaHoraria => _cargaHoraria;

  Carro(this._placa, this.cor, this._ano);
  @override
  String toString() {
    return 'MinhaClasse{cor: $_placa, cor: $cor ano :$_ano }';
  }
}
