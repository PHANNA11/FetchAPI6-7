import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:simple_api/model/product_model.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.pro});
  ProductModel pro;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pro.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlideshow(
              width: double.infinity,
              height: 250,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              onPageChanged: (value) {},
              autoPlayInterval: 3000,
              isLoop: true,
              children: List.generate(widget.pro.images.length,
                  (index) => cardImage(widget.pro.images[index])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.pro.description),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.pro.category.name.toString()),
                  ),
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: cardImage(widget.pro.category.image)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardImage(String image) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image))),
        ),
      );
}
