import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/src/modules/gallery/data/datasources/gallery_cards_datasource.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/grid/gallery_grid_bloc.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/grid/gallery_grid_events.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/grid/gallery_grid_states.dart';
import 'package:mockito/annotations.dart';

import 'gallery_grid_bloc_test.mocks.dart';


@GenerateNiceMocks([MockSpec<GalleryCardsDatasource>()])
void main() {
  final datasource = MockGalleryCardsDatasource();
  GalleryGridBloc bloc = GalleryGridBloc(
      const GalleryGridUpdatePendingProgressIndicators(21),
      datasource: datasource);

  test(
    'Exemplo 01 - Cassi',
    () async {
      /// Exemplo 01 - Cassi
      int c = 1;
      Timer.periodic(const Duration(seconds: 1), (timer) {
        print(c++);
      });

      // Escutar ele e verificar se ta chegando 3 em 3? 1 em 1 até 9 e depois 3 em 3?
      bloc.stream.listen((state) {
        print(state.toString());
      });

      bloc.add((RequestNewPageGalleryGridEvent()));

      await Future.delayed(const Duration(seconds: 8));
    },
    skip: true,
  );

  // blocTest(
  //   'Garante que está chegando filhotes de 1 em 1',
  //   build: () => GalleryGridBloc(
  //     const GalleryGridUpdatePendingProgressIndicators(21),
  //   ),
  //   act: (bloc) => bloc.add(const GalleryGridFetchEvent(3)),
  //   expect: () => [
  //     isA<GalleryGridUpdateCards>(),
  //     isA<GalleryGridUpdatePendingProgressIndicators>(),
  //     isA<GalleryGridInformError>(),
  //   ],
  // );
  test('Garante que está chegando filhotes de 1 em 1 ', skip: false, () async {
    // # Testar o fetch e 

    bloc.add(RequestNewPageGalleryGridEvent());
    await expectLater(
      bloc.stream,
      emitsInOrder(
        [
          isA<GalleryGridUpdateCards>(),
          isA<GalleryGridUpdatePendingProgressIndicators>(),
          isA<GalleryGridInformError>(),
        ],
      ),
    );
  });
}

//  Widget0 (Implementa o Bloc) -> Widget1 -> Widget2 -> (Usar instancia do bloc la do W0).atualiza telinha
//  IoC: Service Locator (GetIt)

// [] Aguarda 5s printa duplicado os 3 estados.
// [x] Printas duplicados os 3 estados e depois aguarda 5 segundos