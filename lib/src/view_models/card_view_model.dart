import 'dart:math';

import 'package:clash_royale/src/models/cr_card.dart';
import 'package:clash_royale/src/services/card_api.dart';
import 'package:flutter/material.dart';

class CardViewModel extends ChangeNotifier{
  List<CrCard> allCards = [];
  List<CrCard> deck = [];
  bool _loading = false;
  bool get loading => _loading;
  final CardApi _service = CardApi();
  Random random = Random();

  Future<void> generateDeck() async {
    _loading = true;
    notifyListeners();

    allCards = await _service.getAll();
    
    for(int i = 0; i > 8; i++){
      int indice = random.nextInt(allCards.length);
        deck.add(allCards[indice]);
    }

    _loading = false;
    notifyListeners();
  }
  
}