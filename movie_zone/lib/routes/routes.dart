import 'package:flut_fix/models/movie.dart';
import 'package:flut_fix/screens/details_screen.dart';
import 'package:flut_fix/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
enum GoRouteNames {
  home,
  detailsScreen,
}
final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: GoRouteNames.home.name,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'details/:id', 
          name: GoRouteNames.detailsScreen.name,
          builder: (context, state) {
            final movie = state.extra as MovieModel; 

            return DetailsScreen(model: movie);
          },
        ),
      ],
    ),
  ],
);