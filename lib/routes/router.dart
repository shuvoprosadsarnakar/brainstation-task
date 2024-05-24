import 'package:brainstation/models/repository.dart';
import 'package:brainstation/screens/home/details.dart';
import 'package:brainstation/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        return const Home();
      },
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (context, state) {
        return Details(item: state.extra as Item);
      },
    ),
  ],
  errorBuilder: (BuildContext context, GoRouterState state) =>
      ErrorScreen(state.error!),
);

/// The screen of the error page.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {super.key});
  final Exception error;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelectableText(error.toString()),
              TextButton(
                onPressed: () => context.go('/'),
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      );
}
