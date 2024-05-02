import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/gallery/domain/exceptions.dart';
import 'package:gallery/src/modules/gallery/domain/gallery_card_entity.dart';
import 'package:gallery/src/modules/puppy/presenter/view/details_page.dart';
// import 'package:go_router/go_router.dart';

import '../bloc/grid/gallery_grid_bloc.dart';
import '../bloc/grid/gallery_grid_events.dart';
import '../bloc/grid/gallery_grid_exceptions_code.dart';
import '../bloc/grid/gallery_grid_states.dart';

import 'card_image.dart';

class GalleryBody extends StatefulWidget {
  const GalleryBody({
    super.key,
    required this.bloc,
  });

  final GalleryGridBloc bloc;

  @override
  State<GalleryBody> createState() => _GalleryBodyState();
}

const galleryFirstPageAmountAprox = 15;

class _GalleryBodyState extends State<GalleryBody> {
  final ScrollController _scrollController = ScrollController();

  List<GalleryCardEntity> cards = List<GalleryCardEntity>.empty(growable: true);

  @override
  initState() {
    addScrollListener();
    addAlertListener();
    super.initState();
  }

  addAlertListener() {
    widget.bloc.stream.listen((GalleryGridState state) {
      if (state is GalleryExceptions) {
        GalleryExceptions exp = state as GalleryExceptions;
        if (exp.code == acabaramOsFilhotesCode) {
          // _scrollController.removeListener(() { });
          // Remover o listening
        }
      }
    });
  }

  addScrollListener() {
    var c = 0;

    /// Quando chega no final da página, ele chama novamente o bloc.add
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          // Chama o endpoint que será responsável por armazenar os cards.
          debugPrint((++c).toString());
          widget.bloc.add(RequestNewPageGalleryGridEvent());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryGridBloc, GalleryGridState>(
        bloc: widget.bloc,
        builder: (context, GalleryGridState state) {
          /// Para qualquer novo estado, o loading é zerado.
          int loadingsAmount = 0;

          if (state is GalleryGridUpdateCards) {
            cards = state.cards;
          }
          if (state is GalleryGridUpdatePendingProgressIndicators) {
            loadingsAmount = state.amount;
          }

          int itemCount = cards.length + loadingsAmount;
          return GridView.builder(
            itemCount: itemCount,

            //TODO: Permitir personalização da rolagem da galeria e do reverse (Axis direction e Reverse).
            // A personalização irá ser desfeita ao fechar o App, salvando apenas em caso de confirmar a caixinha de Alerta

            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
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
              if (index >= cards.length) {
                return const CupertinoActivityIndicator();
              }
              return GestureDetector(
                onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => DetailsPage(
                    petUuid: cards[index].uuid ?? cards[index].id.toString(),
                  ),
                )),
                child: Semantics(
                  label: 'petCardImg$index',
                  child: CardImageWidget(
                    imageUrl: cards[index].url,
                    radius: 5,
                  ),

                  //  Stack(
                  //   children: [
                  //     CardImageWidget(
                  //       imageUrl: cards[index].url,
                  //       radius: 5,
                  //     ),
                  //     Text(cards[index].id.toString()),
                  //   ],
                ),
              );
            },
          );
        });
  }
}
