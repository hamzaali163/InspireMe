import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inspire_me/models/quotesmodel.dart';

class FavProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addToFavorites(QuotesModel model) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _firestore.collection('favorites').doc(uid);

    await docRef.set({
      'quotes': FieldValue.arrayUnion([
        {'quote': model.quote, 'author': model.author, 'category': model.category},
      ]),
    }, SetOptions(merge: true));
    notifyListeners();
  }

  Future<void> removeFromFavorites(QuotesModel model) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _firestore.collection('favorites').doc(uid);

    await docRef.set({
      'quotes': FieldValue.arrayRemove([
        {'quote': model.quote, 'author': model.author, 'category': model.category},
      ]),
    }, SetOptions(merge: true));

    notifyListeners();
  }

  Future<bool> isFavorite(QuotesModel model) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return false;

    final doc = await _firestore.collection('favorites').doc(uid).get();
    if (!doc.exists) return false;

    final data = doc.data();
    final List quotes = data?['quotes'] ?? [];

    return quotes.any((q) => q['quote'] == model.quote);
  }
}
