import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/gen/assets.gen.dart';
import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart';
import 'package:gallery/src/modules/gallery/gallery_module.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/gallery_page_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../components/gallery_view.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final bloc = GalleryPageBloc(
    GalleryPageLoadingState(),
    datasource: galleryIoC.get<GalleryCardsDatasource>(),
  );

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // addScrollListener();
    for(int i = 1; i <= 5; i++){
      bloc.add(FetchGalleryCards(pageNumber: i));
    }

    super.initState();
  }

  addScrollListener() {
    /// Quando chega no final da página, ele chama novamente o bloc.add
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 10) {
          bloc.add(FetchGalleryCards(pageNumber: 4));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Assets.icons.logo512Png.image(height: 32, width: 32, scale: 1),
        middle: const Text('Filhotes disponíveis'),
      ),
      child: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is GalleryPageLoadingState) {
              return Skeletonizer(
                enabled: true,
                child: GridView(
                  // itemCount: 3 * 3 * 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  shrinkWrap: true,
                  primary: false,
                  children: List.generate(
                    3 * 3 * 2,
                    (i) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is GalleryPageSuccessState) {
              return GalleryViewComponent(
                scrollController: _scrollController,
                cards: state.cards,
              );
            } else if (state is GalleryPageFailureState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text(
                  'Ocorreu um erro incomum, contate o suporte',
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
