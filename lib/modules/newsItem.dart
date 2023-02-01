import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';

class newsItem extends StatelessWidget {
  Articles articles;

  newsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage ?? "",
            width: double.infinity,
            height: 180,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          // Image.network(
          //   articles.urlToImage ?? "",
          //   height: 180,
          //   width: double.infinity,
          // ),

          Text(
            articles.author ?? "UNknown",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 10),
          ),
          Text(
            articles.title ?? "UNknown",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Text(
            articles.publishedAt?.substring(0,10) ?? "",
            style: TextStyle(color: Colors.grey.shade700, fontSize: 10),
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}
