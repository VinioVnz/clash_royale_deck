import 'package:clash_royale/src/models/cr_card.dart';
import 'package:flutter/material.dart';

class CrcardCard extends StatelessWidget {
  final CrCard crCard;
  const CrcardCard({super.key, required this.crCard});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.35,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            crCard.iconUrl,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) =>
                const Center(child: Icon(Icons.error, color: Colors.red)),
          ),

          Positioned(
            top: 10,
            left: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/Elixir.png', 
                  width: 20, 
                  height: 28,
                ),
                Text(
                  crCard.elixirCost.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
