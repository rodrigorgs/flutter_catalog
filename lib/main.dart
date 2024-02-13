import 'package:flutter/material.dart';
import 'package:flutter_catalog/exports.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // Import the services package
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/github.dart';
import 'package:markdown_viewer/markdown_viewer.dart';

void main() {
  // runApp(WidgetDemoApp());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: DemoApp(
        examples: [
          Example(exemplo1, 'exemplo1.dart'),
          Example(exemplo2, 'exemplo2.dart'),
          Example(widget_raiz, 'widget_raiz.dart'),
          Example(container_com_filho, 'container_com_filho.dart'),
          Example(container_sem_filho, 'container_sem_filho.dart'),
          Example(container_padding, 'container_padding.dart'),
          Example(col_intro, 'col_intro.dart'),
          Example(col_main_align, 'col_main_align.dart'),
          Example(col_min, 'col_min.dart'),
          Example(col_cross, 'col_cross.dart'),
          Example(col_unbound, 'col_unbound.dart'),
          Example(col_expanded, 'col_expanded.dart'),
          Example(col_flex, 'col_flex.dart'),
          Example(col_flexible, 'col_flexible.dart'),
        ],
      ),
    ),
  ));
}

class Example {
  final Widget Function() home;
  final String sourceFile;

  Example(this.home, this.sourceFile);
}

class DemoApp extends StatefulWidget {
  List<Example> examples;

  DemoApp({super.key, required this.examples});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // Example example = Example(sandbox, 'sandbox.dart');
  int exampleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ExampleView(
            home: widget.examples[exampleIndex].home,
            sourceFile: widget.examples[exampleIndex].sourceFile,
          ),
        ),
        Container(
          height: 40,
          width: double.infinity,
          color: Colors.blueGrey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: exampleIndex <= 0
                    ? null
                    : () => setState(() => exampleIndex--),
                child: const Text('Anterior'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: exampleIndex >= widget.examples.length - 1
                    ? null
                    : () => setState(() => exampleIndex++),
                child: const Text('Próximo'),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}

class ExampleView extends StatelessWidget {
  // final home = () => 1;
  Widget Function() home = () => const Placeholder();
  String sourceFile = '';

  ExampleView({super.key, required this.home, required this.sourceFile});

  String getExplanation(String code) {
    // get all lines starting with //*
    var lines = code.split('\n');
    var explanation = lines
        .where((element) => element.trim().startsWith('//*'))
        .map((e) => e.trim().substring(3).trim())
        .join('\n');
    return explanation;
  }

  getFileContents(String filename) async {
    return await rootBundle.loadString('code/$filename');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: buildCodeWidget(), flex: 1),
        Container(
          width: 1,
          color: Colors.grey[300],
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: home()),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: buildExplanationWidget(),
                    padding: const EdgeInsets.all(16),
                    color: Colors.blueGrey[100],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  FutureBuilder<Object?> buildCodeWidget() {
    return FutureBuilder(
      future: getFileContents(sourceFile),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SourceCodeView("${snapshot.data}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  FutureBuilder<Object?> buildExplanationWidget() {
    return FutureBuilder(
      future: getFileContents(sourceFile),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final explanation = getExplanation(snapshot.data.toString());
          if (explanation.isEmpty) {
            return const Text("No explanation found.");
          } else {
            return MarkdownViewer(
              explanation,
              styleSheet: MarkdownStyle(
                codeSpan: TextStyle(
                  fontFamily: GoogleFonts.firaCode(fontWeight: FontWeight.w600)
                      .fontFamily,
                ),
              ),
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class SourceCodeView extends StatelessWidget {
  final String code;

  const SourceCodeView(this.code, {super.key});

  String transformCode(String text) {
    var lines = text.split('\n');
    // remove explanation
    lines =
        lines.where((element) => !element.trim().startsWith('//*')).toList();
    // remove all lines before the first line that starts with 'Widget'
    var startIndex =
        lines.indexWhere((element) => element.startsWith('Widget'));
    var code = lines.sublist(startIndex + 1).join('\n');
    // remove last line that starts with '}'
    var endIndex = code.lastIndexOf('}');
    code = code.substring(0, endIndex);
    // remove word 'return'
    code = code.replaceAll('return ', '');
    // remove two spaces from the beginning of each line
    code = code
        .split('\n')
        .map((e) => e.length > 2 ? e.substring(2) : e)
        .join('\n');
    return code;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HighlightView(
          transformCode(code),
          language: 'dart',
          theme: githubTheme,
          padding: const EdgeInsets.all(12),
          textStyle: GoogleFonts.firaCode(fontSize: 14),
          // textStyle: GoogleFonts.sourceCodePro(fontSize: 12),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: transformCode(code)));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Copied to clipboard'),
                  duration: Duration(milliseconds: 500),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


// // class WidgetDemoApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: WidgetDemo(),
// //     );
// //   }
// // }

// // class WidgetDemo extends StatefulWidget {
// //   @override
// //   _WidgetDemoState createState() => _WidgetDemoState();
// // }

// // class _WidgetDemoState extends State<WidgetDemo> {
// //   // Sample widgets list
// //   List<Widget> widgets = [
// //     Text('Hello, World!'),
// //     Container(
// //       color: Colors.blue,
// //       height: 100,
// //       width: 100,
// //     ),
// //     IconButton(
// //       icon: Icon(Icons.access_alarm),
// //       onPressed: () {},
// //     ),
// //     // Add more sample widgets here
// //   ];

// //   int selectedIndex = 0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Widget Demo'),
// //       ),
// //       body: Row(
// //         children: [
// //           Expanded(
// //             flex: 1,
// //             child: ListView.builder(
// //               itemCount: widgets.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text('Widget ${index + 1}'),
// //                   onTap: () {
// //                     setState(() {
// //                       selectedIndex = index;
// //                     });
// //                   },
// //                   selected: selectedIndex == index,
// //                 );
// //               },
// //             ),
// //           ),
// //           Expanded(
// //             flex: 2,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Container(
// //                   padding: EdgeInsets.all(16),
// //                   color: Colors.grey[200],
// //                   child: Text(
// //                     'Code:',
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //                 Container(
// //                   padding: EdgeInsets.all(16),
// //                   child: Text(
// //                     widgets[selectedIndex].toString(),
// //                     style: TextStyle(
// //                       fontFamily: 'Courier',
// //                     ),
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: SingleChildScrollView(
// //                     padding: EdgeInsets.all(16),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           'Explanatory Text:',
// //                           style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                         Text(
// //                           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut nulla quam. Proin consequat ligula non ligula tincidunt, in vestibulum urna iaculis. Duis accumsan convallis est, ut bibendum nisi hendrerit at. Aenean auctor mi at risus suscipit, non congue mauris ultrices. Vestibulum et lorem eu risus ullamcorper vehicula. Sed pretium convallis risus id egestas. Integer non metus nec elit luctus convallis nec nec mi. Maecenas vitae faucibus nulla, non efficitur ligula. Nullam nec diam auctor, vehicula tortor et, efficitur nunc. Fusce posuere vehicula arcu, et auctor ex. Ut varius justo eu quam molestie, nec euismod est malesuada. Nullam hendrerit at ex sit amet facilisis. Cras scelerisque at metus a volutpat. Aliquam fringilla vestibulum bibendum. Vivamus nec pretium tortor.',
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
