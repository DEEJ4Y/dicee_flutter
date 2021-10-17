import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  String message = "Click on any dice to roll.";

  @override
  Widget build(BuildContext context) {
    int generateRandomDiceNumber() {
      return Random().nextInt(5) + 1;
    }

    List<int> getNewDiceNumbers() {
      bool areNumbersDifferent = false;
      int newNumberLeft = 1, newNumberRight = 1;
      while (areNumbersDifferent == false) {
        newNumberLeft = generateRandomDiceNumber();
        newNumberRight = generateRandomDiceNumber();

        if (newNumberRight != newNumberLeft) {
          areNumbersDifferent = true;
        }
      }

      return [newNumberLeft, newNumberRight];
    }

    void updateDiceState() {
      List<int> newNumbers = getNewDiceNumbers();
      int leftNumber = newNumbers[0], rightNumber = newNumbers[1];
      String newMessage = "";

      if (leftNumber > rightNumber) {
        newMessage = "Left Wins!";
      } else {
        newMessage = "Right Wins!";
      }

      setState(() {
        leftDiceNumber = leftNumber;
        rightDiceNumber = rightNumber;
        message = newMessage;
      });
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => updateDiceState(),
                    child: Image(
                      image: AssetImage("images/dice$leftDiceNumber.png"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => updateDiceState(),
                    child: Image(
                      image: AssetImage("images/dice$rightDiceNumber.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
