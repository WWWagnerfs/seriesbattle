import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void gerarRelatorio() async {
  final pdf = pw.Document();
  final seriesVencedoras = []; // Suponha que tenha uma lista de séries vencedoras

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: seriesVencedoras.map((serie) {
            return pw.Text('${serie.serie.nome} - Vitórias: ${serie.vitorias}');
          }).toList(),
        );
      },
    ),
  );

  await Printing.layoutPdf(onLayout: (format) => pdf.save());
}

