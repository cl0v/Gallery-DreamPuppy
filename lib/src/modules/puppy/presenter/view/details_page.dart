import 'package:flutter/cupertino.dart';
import 'package:gallery/src/commons/presenter/components/loaders_indicators.dart';
import 'package:gallery/src/modules/puppy/domain/entities/puppy_details_entity.dart';
import 'package:gallery/src/modules/puppy/puppy_module.dart';
import '../../data/puppy_datasource.dart';

import 'details_body.dart';

class DetailsPage extends StatefulWidget {
  final String petUuid;

  const DetailsPage({
    super.key,
    required this.petUuid,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<PuppyDetailsEntity> _future;

  @override
  void initState() {
    _future =
        puppyIoC.get<PuppyDetailsDatasource>().getEntityByUuid(widget.petUuid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Galeria',
        automaticallyImplyLeading: true,
        middle: Text('Detalhes'),
        /*trailing: Tooltip(
          // O google anvisou que está faltando suporte para screen readers para acessibilidade
          message: 'Ver informações sobre a página',
          child: IconButton(
            icon: const Icon(
              Icons.help,
              size: 28,
            ),
            onPressed: () {
              context.pushNamed('wiki');
            },
          ),
        ),*/
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
              return PuppyDetailsBody(puppy: puppy);
            } else {
              return const Center(child: Text('Nothing to see here'));
            }
          },
        ),
      ),
    );
  }
}
