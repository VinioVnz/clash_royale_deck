import 'package:clash_royale/src/models/cr_card.dart';
import 'package:clash_royale/src/view_models/card_view_model.dart';
import 'package:clash_royale/src/widgets/crcard_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CardViewModel viewModel = CardViewModel();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CardViewModel>();
    return Scaffold(
      backgroundColor: Color(0xff1C1C1C),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(36),
        child: viewModel.loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: viewModel.generateDeck,
                    child: const Text('Generate!'),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            childAspectRatio: 0.75,
                          ),
                      itemCount: viewModel.deck.length,
                      itemBuilder: (context, index) {
                        final card = viewModel.deck[index];
                        return CrcardCard(crCard: card);
                      },
                    ),
                  ), 
                
                ],
              ),
      ),
    );
  }
}
