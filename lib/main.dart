import 'dart:async';

import 'package:ecomy/application/downloads/downloads_bloc.dart';
import 'package:ecomy/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:ecomy/application/g_books/bloc/g_book_bloc_bloc.dart';
import 'package:ecomy/domain/downlads/core/di/injectable.dart';
import 'package:ecomy/presentation/main_page/widgets/screen_main_page.dart';
import 'package:ecomy/presentation/main_page/widgets/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (ctx) => getIt<DownloadsBloc>(),
        // ),
        // BlocProvider(
        //   create: (ctx) => getIt<FastLaughBloc>(),
        // ),
        BlocProvider(
          create: (ctx)=> getIt<GBookBlocBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.white),
            titleSmall: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            labelLarge: TextStyle(color: Colors.white),
            labelMedium: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white),
            bodySmall: TextStyle(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: Colors.black,
          useMaterial3: true,
        ),
        home:const splashscreen(),
      ),
    );
  }
}
