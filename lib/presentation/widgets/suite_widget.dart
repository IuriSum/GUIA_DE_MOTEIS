import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guia_de_moteis/domain/suite.dart';

class SuiteWidget extends StatelessWidget {
  final Suite suite;

  const SuiteWidget({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(suite.nome),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: suite.periodos.map((periodo) => 
              Text(
                "${periodo.tempoFormatado} - R\$ ${periodo.valorTotal}",
              )
            ).toList(),
          ),
          CachedNetworkImage(
            imageUrl: suite.fotos.first,
            fit: BoxFit.fitHeight,
          ),
          suite.fotos.length > 1?
            SizedBox(
              height: 100,
              child: CarouselView.weighted(
                flexWeights: [8,4,2],
                itemSnapping: true,
                children: suite.fotos.skip(1).map((foto) => CachedNetworkImage(imageUrl: foto, fit: BoxFit.fitHeight)).toList()
              ),
            )
          : Container(),
        ],
      ),
    );
  }
}