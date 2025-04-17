import 'package:carousel_slider/carousel_slider.dart';
import 'package:flut_fix/constants.dart';
import 'package:flut_fix/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
            height: 300,
            autoPlay: true,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1)),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              context.goNamed(
                GoRouteNames.detailsScreen.name,
                pathParameters: {
                  'id': snapshot.data[itemIndex].id.toString(),
                },
                extra: snapshot.data[itemIndex],
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: SizedBox(
                width: 200,
                height: 300,
                child: Image.network(
                    '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
