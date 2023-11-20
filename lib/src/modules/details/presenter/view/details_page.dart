import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, this.petId = 0});

  final int petId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SizedBox(
          height: size.height / 3,
          child:
              CachedNetworkImage(imageUrl: "https://i.imgur.com/ajzXLgu.jpeg"),
        ),
      ),
    );
  }
}
