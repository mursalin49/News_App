import 'package:flutter/material.dart';
import 'package:news/api_service.dart';
import 'package:news/component/news_lits_item.dart';
import '../model/article_model.dart';

import 'breaking_news.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ArticleModel> articleModel = snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsListItem(
                  articleModel: articleModel[index],
                );
              },
              itemCount: articleModel.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
