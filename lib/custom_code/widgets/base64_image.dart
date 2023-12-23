// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'dart:convert';
import 'dart:typed_data';

class Base64Image extends StatefulWidget {
  const Base64Image({
    Key? key,
    this.width,
    this.height,
    required this.base64,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String? base64;
  @override
  _Base64ImageState createState() => _Base64ImageState();
}

class _Base64ImageState extends State<Base64Image> {
  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;

    imageBytes = widget.base64 != null ? base64Decode(widget.base64!) : null;

    return imageBytes != null
        ? Image.memory(
            imageBytes,
            width: widget.width,
            height: widget.height,
            fit: BoxFit.cover,
          )
        : Container();
  }
}
