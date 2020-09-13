import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapptezt/src/injection.dart';
import 'package:mockito/mockito.dart';

void main() {
  setUpAll(() {
    // Just like in the regular main() function inside main.dart
    configureInjection(Env.dev);
  });

  test(
    "should do something",
        () async {
      // arrange
      final mockCounterRepository = getIt<ICounterRepository>();
      //when(mockCounterRepository.getIncrement()).thenReturn(123);
      //verify(mockCounterRepository.getIncrement()).called(10);
    },
  );
}