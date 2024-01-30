import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class InternalColorTestScreen extends StatelessWidget {
  const InternalColorTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GSText(
          text: 'Color Test (PrimaryColorSwatch)',
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          GSBox(
              style: GSStyle(bg: $GSColors.primary0),
              child: const GSText(text: 'primary0')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary50),
              child: const GSText(text: 'primary50')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary100),
              child: const GSText(text: 'primary100')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary200),
              child: const GSText(text: 'primary200')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary300),
              child: const GSText(text: 'primary300')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary400),
              child: const GSText(text: 'primary400')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary500),
              child: const GSText(text: 'primary500')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary600),
              child: const GSText(text: 'primary600')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary700),
              child: const GSText(text: 'primary700')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary800),
              child: const GSText(text: 'primary800')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary900),
              child: const GSText(text: 'primary900')),
          GSBox(
              style: GSStyle(bg: $GSColors.primary950),
              child: const GSText(text: 'primary950')),
        ],
      ),
    );
  }
}
