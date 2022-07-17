import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'blocs/cart/bloc/cart_bloc.dart';
import 'blocs/wishlist/bloc/wish_list_bloc.dart';
import 'router/router_imports.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishListBloc()..add(StartWishListEvent()),
        ),
        BlocProvider(
          create: (_) => CartBloc()..add(CartStartedEvent()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Food Crunch',
        theme: ThemeData(
          fontFamily: GoogleFonts.outfit().fontFamily,
          primarySwatch: Colors.blue,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
