import 'package:flutter/material.dart';
import 'util.dart';
import 'theme.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Aplub: We Build Products',
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const IntroScreen(),
    );
  }
}

const TextStyle titleStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
);

const TextStyle bodyStyle = TextStyle(
  fontSize: 16.0,
);

// Define asset paths as constants
const String welcomeImage = "assets/welcome.png";
const String productsImage = "assets/products.png";
const String servicesImage = "assets/services.png";
const String getStartedImage = "assets/get_start.png";

// Define page content
const String welcomeTitle = "Welcome to Aplub";
const String welcomeBody =
    "Your one-stop solution for all Flutter development needs.";
const String productsTitle = "Our Products";
const String productsBody =
    "We offer a range of products to boost your productivity.";
const String servicesTitle = "Our Services";
const String servicesBody =
    "We provide top-notch services to meet your business needs.";
const String getStartedTitle = "Get Started";
const String getStartedBody = "Let's build something amazing together!";

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        _buildPage(
          title: welcomeTitle,
          body: welcomeBody,
          image: welcomeImage,
        ),
        _buildPage(
          title: productsTitle,
          body: productsBody,
          image: productsImage,
        ),
        _buildPage(
          title: servicesTitle,
          body: servicesBody,
          image: servicesImage,
        ),
        _buildPage(
          title: getStartedTitle,
          body: getStartedBody,
          image: getStartedImage,
          isLastPage: true,
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => MyHomePage(title: 'Aplub')),
            );
          },
        ),
      ],
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => MyHomePage(title: 'Aplub')),
        );
      },
      onSkip: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => MyHomePage(title: 'Aplub')),
        );
      },
      showSkipButton: true,
      skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
      next: const ElevatedButton(
        onPressed: null,
        child: Text("Next"),
      ),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size.square(10.0),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  PageViewModel _buildPage({
    required String title,
    required String body,
    required String image,
    bool isLastPage = false,
    VoidCallback? onPressed,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Center(
        child: Image.asset(image, height: 345.0),
      ),
      decoration: const PageDecoration(
        titleTextStyle: titleStyle,
        bodyTextStyle: bodyStyle,
        pageColor: Colors.white,
      ),
      footer: isLastPage
          ? ElevatedButton(
              onPressed: onPressed,
              child: const Text("Get Started"),
            )
          : null,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
