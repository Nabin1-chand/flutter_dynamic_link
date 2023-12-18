import 'package:deep_linking/screens/details_screen.dart';
import 'package:deep_linking/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomePage(), routes: [
    // GoRoute(
    //   path: 'details/:id',
    //   builder: (context, state) => DetailsScreen(

    //     id: state.pathParameters['id'] ?? '',
    //   ),
    GoRoute(
        path: 'details',
      
        builder: (context, state) {
          final id = state.extra! as String;
          return DetailsScreen(id: id);
        })
  ])
]);
