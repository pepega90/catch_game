import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

JoystickComponent joystick = JoystickComponent(
    knob: CircleComponent(
      radius: 15,
      paint: BasicPalette.white.withAlpha(200).paint(),
    ),
    background: CircleComponent(
      radius: 50,
      paint: BasicPalette.white.withAlpha(100).paint(),
    ),
    margin: EdgeInsets.only(left: 10, bottom: 10));
