import 'package:flutter/material.dart';

class CardModel {
  final String title;
  final String description;
  final IconData icon;

  CardModel({this.title, this.description, this.icon});
}

List<CardModel> cards = [
  CardModel(
    title: "Favorites",
    description: "Select and book a slot from your favorite Turfs",
    icon: Icons.favorite,
  ),
  CardModel(
    title: "Nearby Turfs",
    description: "Find and book a slot in the Turfs near to you",
    icon: Icons.location_on,
  ),
  CardModel(
    title: "Search Turfs",
    description: "Search Turfs",
    icon: Icons.search,
  ),
];