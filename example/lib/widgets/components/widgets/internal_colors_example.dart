import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class InternalColorTestScreen extends StatelessWidget {
  const InternalColorTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GSText(
          text: 'Color Test (Primary+Secondary)',
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          GSBox(
              style: GlueStyle(bg: $GSColors.primary0),
              child: const GSText(text: 'primary0')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary50),
              child: const GSText(text: 'primary50')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary100),
              child: const GSText(text: 'primary100')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary200),
              child: const GSText(text: 'primary200')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary300),
              child: const GSText(text: 'primary300')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary400),
              child: const GSText(text: 'primary400')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary500),
              child: const GSText(text: 'primary500')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary600),
              child: const GSText(text: 'primary600')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary700),
              child: const GSText(text: 'primary700')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary800),
              child: const GSText(text: 'primary800')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary900),
              child: const GSText(text: 'primary900')),
          GSBox(
              style: GlueStyle(bg: $GSColors.primary950),
              child: const GSText(text: 'primary950')),
          //------------Secondary----------
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary0),
              child: const GSText(text: 'secondary0')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary50),
              child: const GSText(text: 'secondary50')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary100),
              child: const GSText(text: 'secondary100')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary200),
              child: const GSText(text: 'secondary200')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary300),
              child: const GSText(text: 'secondary300')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary400),
              child: const GSText(text: 'secondary400')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary500),
              child: const GSText(text: 'secondary500')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary600),
              child: const GSText(text: 'secondary600')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary700),
              child: const GSText(text: 'secondary700')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary800),
              child: const GSText(text: 'secondary800')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary900),
              child: const GSText(text: 'secondary900')),
          GSBox(
              style: GlueStyle(bg: $GSColors.secondary950),
              child: const GSText(text: 'secondary950')),
        ],
      ),
    );
  }
}
