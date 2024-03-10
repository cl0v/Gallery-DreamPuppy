import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/grid/gallery_grid_events.dart';
import '../grid/gallery_grid_bloc.dart';
import 'gallery_page_events.dart';
import 'gallery_page_states.dart';

//TODO: Adicionar uma mensagem de Alerta para avisar que algo deu errado.
class GalleryToastAlertState implements GalleryPageState {}

const int initialFetchAmount = 24; // [link] Precisam ser multiplos inteiros
const int subsequentFetchesAmount = 6; // [link] Precisam ser multiplos inteiros
const int pageLimitReached = 14;

class GalleryPageBloc extends Bloc<GalleryPageEvent, GalleryPageState> {
  final GalleryGridBloc gridBloc;

  GalleryPageBloc(super.initialState, {required this.gridBloc}) {
    on<LoadGridGalleryPageEvent>(init);
    on<SuccessGridGalleryPageEvent>(show);
    on<ErrorGridGalleryPageEvent>(alert);
  }

  FutureOr<void> init(
    _,
    Emitter<GalleryPageState> emit,
  ) async {
    emit(GalleryPageLoadingState());
    gridBloc.add(
      FillGalleryGridEvent(
        onFinish: () {
          add(SuccessGridGalleryPageEvent());
        },
        onError: (err) {
          add(ErrorGridGalleryPageEvent(
            err.code,
            message: err.message,
          ));
        },
      ),
    );
  }

  FutureOr<void> show(
      SuccessGridGalleryPageEvent event, Emitter<GalleryPageState> emit) {
    emit(GalleryPageSuccessState());
  }

  FutureOr<void> alert(
      ErrorGridGalleryPageEvent event, Emitter<GalleryPageState> emit) {
    emit(
      GalleryPageFailureState(
        event.code,
        message: event.message,
      ),
    );
  }
}
