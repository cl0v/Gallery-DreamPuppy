import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/commons/presenter/components/circular_loading.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/gallery_page_bloc.dart';
import '../components/gallery_view.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final bloc = GalleryPageBloc(GalleryPageLoadingState());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // Uncomment to change the background color
      // backgroundColor: CupertinoColors.systemPink,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Filhotes disponíveis'),
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
                cards: state.cards,
              );
            } else if (state is GalleryPageFailureState) {
              return Center(
                child: Text('${state.message} [${state.code}]}'),
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
