import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/gen/assets.gen.dart';
import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart';
import 'package:gallery/src/modules/gallery/gallery_module.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/gallery_page_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../kennel/domain/usecases/on_redirect_contact_usecase.dart';
import '../components/gallery_body.dart';

enum PageStates {
  loading,
  bottomReached,
  idle,
  error,
}

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

  PageStates currentState = PageStates.loading;

  @override
  void initState() {
    for (int i = 0; i <= 6; i++) {
      bloc.add(FetchGalleryCards());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: IconButton(
          icon: const Icon(Icons.support_agent),
          onPressed: () async {
            await OnRedirectContactUsecase()
                .launchWhatsapp(context, '33997312898');
          },
        ),
        leading: Assets.icons.logo512Png.image(height: 32, width: 32, scale: 1),
        middle: const Text('Filhotes disponíveis'),
      ),
      child: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is GalleryPageLoadingState) {
              return const GalleryPageLoadingWidget();
            } else if (state is GalleryPageFailureState) {
              return GalleryPageErrorWidget(state.message);
            } else {
              return GalleryBody(bloc: bloc);
            }
          },
        ),
      ),
    );
  }
}

class GalleryPageErrorWidget extends StatelessWidget {
  final String message;

  const GalleryPageErrorWidget(
    this.message, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}

class GalleryPageLoadingWidget extends StatelessWidget {
  const GalleryPageLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
