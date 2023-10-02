part of 'text_bloc.dart';

class TextState {
  String? text;

  TextState({required this.text});
}

class InitialText extends TextState {
  InitialText() : super(text: 'Hi');
}
