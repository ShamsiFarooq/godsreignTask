import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/text/text_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text(
            'Using Bloc',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<TextBloc, TextState>(
                builder: (context, state) {
                  return Text(
                    '${state.text}',
                    style: const TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<TextBloc>().add(ChangeText());

                  // BlocProvider.of<TextBloc>(context).add(ChangeText());
                },
                child: const Text('Change Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
