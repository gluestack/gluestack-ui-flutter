library generator;

import 'package:gs_generators/src/logic.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';


Builder styleGeneratorBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [ToStringGenerator()],
    'gs',
  );
}

