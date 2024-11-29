import 'package:go_router/go_router.dart';
import 'package:parcial/presentation/screens/screen.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/character',
    name: CharacterScreen.name,
    builder: (context, state) => const CharacterScreen(),
  ),
  GoRoute(
    path: '/planets',
    name: PlanetScreen.name,
    builder: (context, state) => const PlanetScreen(),
  ),
  GoRoute(
    path: '/config',
    name: ConfigScreen.name,
    builder: (context, state) => const ConfigScreen(),
  ),
  GoRoute(
    path: '/pokemon',
    name: PokemonsScreen.name,
    builder: (context, state) => PokemonsScreen(),
  )
]);
