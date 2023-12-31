import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/article_model.dart';
import 'package:news/ui/news_details.dart';

class NewsListItem extends StatelessWidget {
  final ArticleModel articleModel;

  const NewsListItem({Key? key, required this.articleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(
                      articleModel: articleModel,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
              imageUrl: articleModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    articleModel.source!.name.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(articleModel.publishedAt.toString())
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Written by " + articleModel.author.toString(),
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(articleModel.title.toString())
          ],
        ),
      ),
    );
  }
}
