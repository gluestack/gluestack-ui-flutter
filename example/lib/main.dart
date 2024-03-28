import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

void main() {
  runApp((MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GluestackStateN(
          test: 'Start -Before',
          child: Center(
            child: Column(
              children: [
                GSTempButton(
                  radii: GSRadiis.$sm,
                  child: Text('Temp Button'),
                ),
                Builder(builder: (context) {
                  return ButtonBar(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          GluestackStateN? gluestackScope =
                              GluestackStateN.of(context);

                          gluestackScope!.updateTestToken('NEW');
                          // gluestackScope.radiiToken[GSRadiiToken2().$sm] =
                          //     100;
                        },
                        child: const Text('0 Button'),
                      ),
                      TextButton(
                        onPressed: () {
                          log('Pressaed');

                          final GluestackStateN? gluestackScope =
                              GluestackStateN.of(context);
                          gluestackScope?.updateTestToken('testNew');
                          gluestackScope?.updateRadiiToken({
                            "none": 2,
                            "xs": 5,
                            "sm": 990,
                            "md": 20,
                            "lg": 33,
                            "xl": 44,
                            "2xl": 55,
                            "3xl": 66,
                            "full": 999,
                          });
                          log(gluestackScope!.radiiToken.toString());
                          log(gluestackScope!.test.toString());
                        },
                        child: const Text('10 Button'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('999 Button'),
                      ),
                    ],
                  );
                }),
              ],
            ),
          )),
    );
  }
}
