import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/gen/assets.gen.dart';
import 'package:gallery/src/commons/presenter/components/circular_loading.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/gallery_page_bloc.dart';
import '../components/gallery_view.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final bloc = GalleryPageBloc();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    onScrollReachEnd();
    bloc.add(FetchGalleryCards(amount: 30));
    super.initState();
  }

  onScrollReachEnd() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 10) {
        bloc.add(FetchGalleryCards(amount: 4));
      }
    });
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
              return const Center(
                child: CircularLoadingWidget(),
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
                child: Text('Ocorreu um erro incomum, contate o suporte'),
              );
            }
          },
        ),
      ),
    );
  }
}
