import 'dart:io';
import 'package:flutter/material.dart';

class ResponseParserService {
  final Map<String, dynamic> responseJson;

  ResponseParserService({required this.responseJson}) {
    _init();
  }

  void _init() {
    if (responseJson.containsKey('error') || 
      !responseJson.containsKey('sucesso') || 
      responseJson['sucesso'] == false) {
      exit(1);
    }
  }

  List<Map<String, dynamic>> getMotels() {
    try{
      int pagina = responseJson["data"]['pagina']??0;
      int qtdPorPagina = responseJson["data"]['qtdPorPagina']??0;

      if(!responseJson["data"].containsKey("moteis")){
        throw Exception("No motels found");
      }
      // Prevencao de deep copy
      List<Map<String, dynamic>> motels = List<Map<String, dynamic>>.from(responseJson["data"]['moteis']);
      
      if(qtdPorPagina > 0 && pagina > 0){
        motels = motels.skip((pagina - 1) * qtdPorPagina).take(qtdPorPagina).toList();
      }

      return motels;

    }
    catch(e) {
      debugPrint(e.toString());
      return [];
    }
  }
}