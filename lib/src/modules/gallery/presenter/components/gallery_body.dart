import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/gallery/domain/gallery_card_entity.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/grid/gallery_grid_states.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/page/gallery_page_states.dart';
import 'package:go_router/go_router.dart';

import '../bloc/page/gallery_page_bloc.dart';
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

const galleryFirstPageAmountAprox = 15;

class _GalleryBodyState extends State<GalleryBody> {
  final ScrollController _scrollController = ScrollController();

  List<GalleryCardEntity> cards = List<GalleryCardEntity>.empty(growable: true);
  bool isFetchBlocked = false;

  @override
  initState() {
    addScrollListener();
    super.initState();
  }

  addScrollListener() {
    /// Quando chega no final da página, ele chama novamente o bloc.add
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent <
            _scrollController.offset) {
          debugPrint('Bateu no fundo $isFetchBlocked');
          if (isFetchBlocked) return;
          isFetchBlocked = true;
          // Chama o endpoint que será responsável por armazenar os cards.
          widget.bloc.add(AddOneLineToGalleryGrid());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryPageBloc, GalleryPageState>(
        bloc: widget.bloc,
        builder: (context, GalleryPageState state) {
          if (state is UpdateGalleryPageSuccessState) {
            cards = state.cards;
            isFetchBlocked = false;
          }
          return GridView.builder(
            itemCount: cards.length,
            //TODO: Permitir personalização da rolagem da galeria e do reverse (Axis direction e Reverse).
            // A personalização irá ser desfeita ao fechar o App, salvando apenas em caso de confirmar a caixinha de Alerta
            dragStartBehavior:
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
        });
  }
}
