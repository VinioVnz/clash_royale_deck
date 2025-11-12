import 'package:clash_royale/app.dart';
import 'package:clash_royale/src/view_models/card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() {
  //dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(create: (_) => CardViewModel(), child: const App()),
  );
}
