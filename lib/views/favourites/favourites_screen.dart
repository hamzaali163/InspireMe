import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspire_me/core/constants/appcolors.dart';
import 'package:inspire_me/core/constants/apptextstyles.dart';
import 'package:inspire_me/models/quotesmodel.dart';
import 'package:inspire_me/providers/fav_provider.dart';
import 'package:inspire_me/routes/route_names.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, RouteNames.loginscreen);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Consumer<FavProvider>(
          builder: (context, favvm, child) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('favorites')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists) {
                  return const Center(child: Text('No favorites found.'));
                }

                final quotes = snapshot.data!.get('quotes') as List;

                if (quotes.isEmpty) {
                  return const Center(child: Text('No favorites found.'));
                }

                return ListView.builder(
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    final quoteMap = quotes[index];
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                          trailing: IconButton(
                            icon: const Icon(Icons.favorite, color: AppColors.heartIcon),
                            onPressed: () {
                              favvm.removeFromFavorites(
                                QuotesModel(
                                  quote: quoteMap['quote'],
                                  author: quoteMap['author'],
                                  category: quoteMap['category'],
                                ),
                              );
                            },
                          ),
                          title: Text(quoteMap['quote'] ?? '', style: AppTextStyles.label(context)),
                          subtitle: Text(quoteMap['author'] ?? '', style: const TextStyle(color: AppColors.accent)),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
