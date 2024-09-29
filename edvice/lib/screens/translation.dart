import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart'; 
import 'package:image_picker/image_picker.dart';
import 'package:translator/translator.dart';

import 'home_screen.dart';

class Mentor extends StatefulWidget {
  const Mentor({super.key});

  @override
  State<Mentor> createState() => _MentorState();
}

class _MentorState extends State<Mentor> {
  String _extractedText = ''; 
  String _translatedText = ''; 
  final picker = ImagePicker();
  final translator = GoogleTranslator(); 

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path); 
      await _recognizeText(imageFile); 
    } else {
      setState(() {
        _extractedText =
            'No image selected'; 
      });
    }
  }

  Future<void> _recognizeText(File imageFile) async {
    final inputImage = InputImage.fromFile(
        imageFile); 
    final textRecognizer =
        TextRecognizer(); 

    try {
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage); 
      setState(() {
        _extractedText = recognizedText.text; 
      });

      if (_extractedText.isEmpty) {
        setState(() {
          _extractedText =
              'No text recognized in the image'; 
        });
      }

      await textRecognizer.close(); 
    } catch (e) {
      setState(() {
        _extractedText =
            'Failed to recognize text: $e'; 
      });
    }
  }

  Future<void> _translateText(String languageCode) async {
    if (_extractedText.isNotEmpty) {
      try {
        final translation = await translator.translate(_extractedText,
            to: languageCode); 
        setState(() {
          _translatedText = translation.text; 
        });
      } catch (e) {
        setState(() {
          _translatedText =
              'Translation failed: $e'; 
        });
      }
    } else {
      setState(() {
        _translatedText =
            'No text to translate'; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        title: const Text('Text Recognition & Translation'),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              _extractedText.isNotEmpty
                  ? Text(
                      'Extracted Text: $_extractedText') 
                  : const Text(
                      'No text recognized yet.'), 
              const SizedBox(height: 20),
              _translatedText.isNotEmpty
                  ? Text(
                      'Translated Text: $_translatedText') 
                  : const Text(
                      'No translation available yet.'), 
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getImage, 
                child: const Text('Pick an Image'),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                hint: const Text(
                    'Translate to...'), 
                items: <String>['es', 'fr', 'de', 'hi', 'zh']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    _translateText(
                        newValue); 
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}