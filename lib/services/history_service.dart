import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/history/models/history_item.dart';

class HistoryService extends ChangeNotifier {
  static const _key = 'game_history';
  final List<HistoryItem> _items = [];

  List<HistoryItem> get items => List.unmodifiable(_items);

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data != null) {
      final decoded = jsonDecode(data) as List;
      _items
        ..clear()
        ..addAll(decoded.map((e) => HistoryItem.fromJson(e)));
      notifyListeners();
    }
  }

  Future<void> add(HistoryItem item) async {
    _items.insert(0, item);
    await _save();
    notifyListeners();
  }

  Future<void> delete(int index) async {
    _items.removeAt(index);
    await _save();
    notifyListeners();
  }

  Future<void> clear() async {
    _items.clear();
    await _save();
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      _key,
      jsonEncode(_items.map((e) => e.toJson()).toList()),
    );
  }
}