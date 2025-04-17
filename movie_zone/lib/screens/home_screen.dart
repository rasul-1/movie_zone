import 'package:flut_fix/Widgets/movies_slider.dart';
import 'package:flut_fix/Widgets/trending_movies.dart';
import 'package:flut_fix/api/api.dart';
import 'package:flut_fix/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieModel>> trendingMovies;
  late Future<List<MovieModel>> topratedMovies;
  late Future<List<MovieModel>> upcomingMovies;
   
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topratedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          fit: BoxFit.cover,
          height: 24,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies 🔥',
                style: GoogleFonts.aBeeZee(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot){
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.hasError.toString()),
                      );
                    }else if(snapshot.hasData){
                      return TrendingMovies(snapshot: snapshot);
                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }

                  },
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Top Rated Movies ⭐️',
                style: GoogleFonts.aBeeZee(fontSize: 24),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: topratedMovies,
                  builder: (context, snapshot){
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.hasError.toString()),
                      );
                    }else if(snapshot.hasData){
                      return MoviesSlider(snapshot: snapshot);
                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }

                  },
                ),
              ),
              Text(
                'Upcoming Movies 👀',
                style: GoogleFonts.aBeeZee(fontSize: 24),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot){
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.hasError.toString()),
                      );
                    }else if(snapshot.hasData){
                      return MoviesSlider(snapshot: snapshot);
                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
