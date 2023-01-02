import 'package:web_socket_channel/web_socket_channel.dart';

class MarketRepository {
  WebSocketChannel connectSocket() {
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://echo.websocket.events'),
    );
    return channel;
  }
}
