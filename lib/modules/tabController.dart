import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/modules/newsItem.dart';
import 'package:news/modules/tabItem.dart';
import 'package:news/shared/remote/api_manager.dart';
import 'package:news/styles/colors.dart';

class tabController extends StatefulWidget {
  List<Sources>sources;
  tabController(this.sources);

  @override
  State<tabController> createState() => _tabControllerState();
}

class _tabControllerState extends State<tabController> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        //initialIndex:selectedIndex ,
        child:
        Column(
          children: [
            TabBar(
               padding: EdgeInsets.symmetric(vertical: 8),
              indicatorColor:Colors.transparent ,
              onTap: (value) {
                selectedIndex=value;
                setState(() {
                });
              },
              //labelColor: Colors.blue,
              isScrollable: true,
              tabs:widget.sources.map((src) => TabItem(src.name??"Unknown",
              widget.sources.indexOf(src)==selectedIndex?true:false)).toList(),
            ),
            FutureBuilder<NewsResponse>(
              future: ApiManager.getNews(widget.sources[selectedIndex].id??""),
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
              var news = snapshot.data?.articles?? [];
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                  return newsItem(news[index]);
                },
                    itemCount: news.length,),
              ) ;
            },)
          ],
        ));
  }
}
