import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsitePage extends StatefulWidget {
  final String url; // Passa a URL desejada

  // O construtor recebe o link que será aberto
  const WebsitePage({Key? key, required this.url}) : super(key: key);

  @override
  State<WebsitePage> createState() => _WebsitePageState();
}

class _WebsitePageState extends State<WebsitePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Inicializando o controlador do WebView
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Atualizando a barra de progresso, se necessário
            debugPrint('Progresso: $progress%');
          },
          onPageStarted: (String url) {
            debugPrint('Página começou a carregar: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Página carregada: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Erro de carregamento: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            // Bloqueando navegação para YouTube como exemplo
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url)); // Carrega o URL passado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Navegação Web",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
