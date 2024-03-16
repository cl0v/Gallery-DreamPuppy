import 'package:flutter/cupertino.dart';
import 'package:gallery/src/commons/presenter/components/loaders_indicators.dart';
import 'package:gallery/src/modules/puppy/domain/entities/pet_details.dart';
import 'package:gallery/src/modules/puppy/puppy_module.dart';
import '../../data/puppy_datasource.dart';

import 'details_body.dart';

class DetailsPage extends StatefulWidget {
  final int petId;

  const DetailsPage({
    super.key,
    required this.petId,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<PuppyDetailsEntity> _future;

  @override
  void initState() {
    _future = puppyIoC.get<PuppyDetailsDatasource>().getEntity(widget.petId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Galeria',
        automaticallyImplyLeading: true,
        middle: Text('Detalhes'),
      ),
      child: SafeArea(
        child: FutureBuilder<PuppyDetailsEntity>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularLoadingWidget(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              var puppy = snapshot.data as PuppyDetailsEntity;
              return PuppyDetailsBody(puppy);
            } else {
              return const Center(child: Text('Nothing to see here'));
            }
          },
        ),
      ),
    );
  }
}
