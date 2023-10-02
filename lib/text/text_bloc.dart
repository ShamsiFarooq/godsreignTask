import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'text_event.dart';
part 'text_state.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(InitialText()) {
    on<ChangeText>((event, emit) {
      final changeText = "Hello";
      return emit(TextState(text: changeText));
    });
  }
}
