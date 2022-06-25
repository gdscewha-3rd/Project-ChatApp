import 'package:flutter/material.dart';

class ChattingProvider extends ChangeNotifier {
  ChattingProvider(this.id, this.name);
  late final String id;
  late final String name;
}