import 'dart:ui';
import 'package:flutter/material.dart';


const Color colorMainText = Color(0x8A000000);

const Color colorPrimary = Color(0xff009688);
const Color colorSecondary = Color(0xffffffff);
const Color colorContrast = Color(0xffe1e2e1);
const Color accent = Color(0xffFFC107);
const Color additionalButton = Color(0xffff5722);

const kRoundedTextFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(32.0)),
);

const kRoundedTextFieldEnabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.white, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(32.0)),
);

const kRoundedTextFieldFocusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.white, width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(32.0)),
);

const kRoundedTextFieldHintStyle = TextStyle(
  color: Colors.grey,
);

const kRoundedTextFieldPadding = EdgeInsets.symmetric(
  vertical: 10.0,
  horizontal: 20.0,
);

const kRoundedTextFieldDecoration = InputDecoration(
  hintStyle: kRoundedTextFieldHintStyle,
  contentPadding: kRoundedTextFieldPadding,
  fillColor: Colors.white,
  filled: true,
  border: kRoundedTextFieldBorder,
  enabledBorder: kRoundedTextFieldEnabledBorder,
  focusedBorder: kRoundedTextFieldFocusedBorder,
);
