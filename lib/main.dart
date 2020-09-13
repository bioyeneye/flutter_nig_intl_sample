import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterapptezt/src/injection.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  configureInjection(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate, GlobalWidgetsLocalizations.delegate, S.delegate],
      supportedLocales: S.delegate.supportedLocales,

      home: ChangeNotifierProvider(
        create: (_) => getIt<CounterChangeNotifier>(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
//      ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  var title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterChangeNotifier>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.value}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Text(S.of(context).intro, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            RaisedButton(
              child: Text("English"),
              onPressed: () {
                setState(
                  () {
                    //S.load(Locale('en', 'US'));
                    S.load(Locale.fromSubtags(languageCode: 'en'));
                  },
                );
              },
            ),
            RaisedButton(
              child: Text("Yoruba"),
              onPressed: () {
                setState(
                  () {
                    S.load(Locale.fromSubtags(languageCode: 'yo'));
                  },
                );
              },
            ),
            RaisedButton(
              child: Text("Hawusa"),
              onPressed: () {
                setState(
                  () {
                    S.load(Locale.fromSubtags(languageCode: 'ha'));
                  },
                );
              },
            ),
            RaisedButton(
              child: Text("Igbo"),
              onPressed: () {
                setState(
                  () {
                    S.load(Locale.fromSubtags(languageCode: 'ig'));
                  },
                );
              },
            ),
            RaisedButton(
              child: Text("Fulani"),
              onPressed: () {
                setState(
                  () {
                    S.load(Locale.fromSubtags(languageCode: 'fl'));
                  },
                );
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<CounterChangeNotifier>(context).increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
