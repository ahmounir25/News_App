import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/models/categories.dart';
import 'package:news/modules/tabController.dart';
import 'package:news/shared/remote/api_manager.dart';

class homeScreen extends StatelessWidget {
 static const String routeName='homeScreen';
categories category;
homeScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong'),
                  TextButton(onPressed: () {}, child: Text('Try Again')),
                ],
              ),
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data?.message ?? ""),
                  TextButton(onPressed: () {}, child: Text('Try Again')),
                ],
              ),
            );
          }
          var sources = snapshot.data?.sources?? [];
          return tabController(sources) ;
        });
  }
}
