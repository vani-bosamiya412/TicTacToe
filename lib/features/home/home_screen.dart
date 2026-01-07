import 'package:flutter/material.dart';
import 'package:untitled/core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import 'widgets/game_mode_card.dart';
import '../game/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.08),

                  Text(
                    'Tic Tac Toe',
                    style: TextStyle(
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),

                  SizedBox(height: size.height * 0.01),

                  Text(
                    'Choose how you want to play',
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: Colors.black54,
                    ),
                  ),

                  SizedBox(height: size.height * 0.06),

                  GameModeCard(
                    icon: AppIcons.player,
                    title: 'Player vs Player',
                    subtitle: 'Play with a friend on the same device',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameScreen(isAI: false),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: size.height * 0.03),

                  GameModeCard(
                    icon: AppIcons.ai,
                    title: 'Player vs AI',
                    subtitle: 'Challenge the computer opponent',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameScreen(isAI: true),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: size.height * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
