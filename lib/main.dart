import 'package:flutter/material.dart';

void main() {
  runApp(MorseApp());
}

class MorseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traduction Morse - Rendu Charles Lambret',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MorseTranslator(),
    );
  }
}

class MorseTranslator extends StatefulWidget {
  @override
  _MorseTranslatorState createState() => _MorseTranslatorState();
}

class _MorseTranslatorState extends State<MorseTranslator> {
  final Map<String, String> morseCode = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
    'G': '--.', 'H': '....', 'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
    'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
    'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
    'Y': '-.--', 'Z': '--..', '0': '-----', '1': '.----', '2': '..---',
    '3': '...--', '4': '....-', '5': '.....', '6': '-....', '7': '--...',
    '8': '---..', '9': '----.', ' ': '/'
  };

  String inputText = "";
  String morseOutput = "";

  String translateToMorse(String text) {
    String morse = '';
    text = text.toUpperCase(); 
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (morseCode.containsKey(char)) {
        morse += morseCode[char]! + ' ';
      } else {
        morse += '? '; 
      }
    }
    return morse.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traduction Morse'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Entrez le texte à traduire",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  morseOutput = translateToMorse(inputText);
                });
              },
              child: Text('Traduire en Morse'),
            ),
            SizedBox(height: 20),
            Text(
              'Résultat en code Morse:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              morseOutput,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
