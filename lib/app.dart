
import 'package:flutter/cupertino.dart';
import 'src/modules/gallery/presenter/view/gallery_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'DreamPuppy - Gallery',
      home: GalleryPage(),
      theme: CupertinoThemeData(brightness: Brightness.light),
    );
  }
}