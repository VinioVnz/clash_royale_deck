import 'dart:convert';

import 'package:clash_royale/src/models/cr_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class CardApi {

  final String baseUrl = 'https://api.clashroyale.com/v1/cards';
  final String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6Ijg3NmZjYTRmLWFkYmEtNGMxYy1hNWY1LWUxMTY4YmU1NGZlNyIsImlhdCI6MTc2MzA2NDE2OCwic3ViIjoiZGV2ZWxvcGVyLzFhMzcyZThmLTViNDYtMWFjMC1iMmMwLWY0MWNiNDQ3NTY1MSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxNzcuNzQuMjIwLjE1MyJdLCJ0eXBlIjoiY2xpZW50In1dfQ.Sv0H2xaxCeq0xe4XGJpt1b5HaxYaEyEoYtqaXozf2iE7bT0aMoLqlWDTIKHwbZoQBuj1dffxvmcIHi5jKJaQkw';
  Future<List<CrCard>> getAll() async{

     final response = await http.get(
      Uri.parse(baseUrl),
      headers: {'Authorization': 'Bearer $token'}
      );
      if(response.statusCode != 200){
        throw Exception('Erro no request, status code: ${response.statusCode}');
      }
      final Map<String,dynamic> decoded = jsonDecode(response.body);
      final List<dynamic> data = decoded['items'];
      
      return data.map((json) => CrCard.fromJson(json)).toList();
  }
}