import 'dart:convert';

import 'package:clash_royale/src/models/cr_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CardApi {
  final String baseUrl = 'https://api.clashroyale.com/v1/cards';

  Future<List<CrCard>> getAll() async{
     final response = await http.get(
      Uri.parse(baseUrl),
      headers: {'Authorization': 'Bearer ${dotenv.env['API_TOKEN']}'}
      );
      if(response.statusCode != 200){
        throw Exception('Erro no request, status code: ${response.statusCode}');
      }
      final List<dynamic> data = jsonDecode(response.body);
      
      return data.map((json) => CrCard.fromJson(json)).toList();
  }
}