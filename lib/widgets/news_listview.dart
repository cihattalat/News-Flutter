import 'package:flutter/material.dart';
import 'package:news_app/models/news_api_model.dart';
import 'package:news_app/services/news_services_api.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late Future<List<Article>> newsApi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsApi = NewsApiServices.fetchNewsArticle();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: newsApi,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      onTap: (){
                        launch(snapshot.data![index].url);
                      },
                      leading: SizedBox(
                        width: 120,
                          child:
                              Image.network(snapshot.data![index].urlToImage)),
                      title: Text(snapshot.data![index].title),
                      subtitle: Text(
                        snapshot.data![index].description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child:
                Text("Bir hata oluştu lütfen daha sonra tekrar deneyiniz..."),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
