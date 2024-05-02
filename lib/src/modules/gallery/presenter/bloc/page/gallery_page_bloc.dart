import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/src/modules/gallery/presenter/bloc/grid/gallery_grid_events.dart';
import '../../../domain/coordinates.dart';
import '../grid/gallery_grid_bloc.dart';
import 'gallery_page_events.dart';
import 'gallery_page_states.dart';

import 'package:geolocator/geolocator.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

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
    //TODO: A primeira vez das coordenadas não está sendo exibido
    debugPrint('A primeira vez das coordenadas não está sendo exibido');
    GeoCoordinates? coordinates;
    
    try {
      var pos = await _determinePosition();
      coordinates = GeoCoordinates(
        latitude: pos.latitude,
        longitude: pos.longitude,
      );
    } catch (e) {
      debugPrint('Position not available');
    }

    gridBloc.add(
      FillGalleryGridEvent(
        coordinates: coordinates,
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
