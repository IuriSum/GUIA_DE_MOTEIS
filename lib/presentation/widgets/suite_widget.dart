import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis/data/parsers/data_parser.dart';
import 'package:guia_de_moteis/domain/suite.dart';
import 'package:guia_de_moteis/presentation/colors/colors.dart';

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
          Text(
            suite.nome,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: suite.periodos.map((periodo) => 
                      Text(
                        periodo.tempoFormatado,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.primaryTextColor
                        ),
                      )
                    ).toList(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: suite.periodos.map((periodo) => 
                      Text(
                        "  •  R\$ ${doubleToRealFormat(periodo.valor)}",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.primaryTextColor
                        ),
                      )
                    ).toList(),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  (suite.qtd > 0 && suite.exibirQtdDisponiveis) ? "Disponíveis: ${suite.qtd}" : "Indisponível",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.primaryTextColor
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: suite.fotos.first,
              fit: BoxFit.fitHeight,
            ),
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