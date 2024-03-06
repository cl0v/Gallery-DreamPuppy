import 'package:flutter/cupertino.dart';
import 'package:gallery/src/modules/gallery/domain/gallery_card_entity.dart';
import 'package:go_router/go_router.dart';

import '../bloc/gallery_page_bloc.dart';
import 'card_image.dart';

class GalleryBody extends StatefulWidget {
  const GalleryBody({
    super.key,
    required this.bloc,
  });

  final GalleryPageBloc bloc;

  @override
  State<GalleryBody> createState() => _GalleryBodyState();
}

class _GalleryBodyState extends State<GalleryBody> {
  final ScrollController _scrollController = ScrollController();

  List<GalleryCardEntity> cards = [];

  bool isFetchBlocked = false;

  @override
  initState() {
    addScrollListener();

    widget.bloc.stream.listen((event) {
      if (event is! UpdateGalleryPageSuccessState) {
        return;
      }
      setState(() {
        cards.addAll(event.cards);
        isFetchBlocked = false;
      });
    });
    super.initState();
  }

  addScrollListener() {
    /// Quando chega no final da página, ele chama novamente o bloc.add
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent <
            _scrollController.offset) {
          if (isFetchBlocked) return;
          debugPrint('Bateu no fundo, chama 2x o fetch');
          isFetchBlocked = true;
          // Chama o endpoint que será responsável por armazenar os cards.
          for (var i = 0; i < 2; i++) {
            widget.bloc.add(AddOneLineToGalleryGrid());
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cards.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      shrinkWrap: true,
      primary: false,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => context.pushNamed(
            'puppy',
            pathParameters: {
              'id': cards[index].id.toString(),
            },
          ),
          child: Semantics(
            label: 'petCardImg$index',
            child: CardImageWidget(
              imageUrl: cards[index].url,
              radius: 5,
            ),
          ),
        );
      },
    );
  }
}
