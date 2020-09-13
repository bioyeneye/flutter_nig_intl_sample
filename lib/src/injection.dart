import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

const dev = Environment(Env.dev);
const prod = Environment(Env.prod);

final getIt = GetIt.instance;
@injectableInit
void configureInjection(String environment) =>
    $initGetIt(getIt, environment: environment);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}

abstract class ICounterRepository {
  int getIncrement();
}

@prod
@Injectable(as: ICounterRepository)
class CounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 1;
}

@dev
@Injectable(as: ICounterRepository)
class DevCounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 2;
}

@injectable
class CounterChangeNotifier extends ChangeNotifier {
  final ICounterRepository _counterRepository;

  CounterChangeNotifier(this._counterRepository);

  int _value = 0;
  int get value => _value;

  void increment() {
    _value += _counterRepository.getIncrement();
    notifyListeners();
  }
}