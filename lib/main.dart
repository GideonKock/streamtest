import 'package:fluent_ui/fluent_ui.dart';
import 'package:dart_vlc/dart_vlc.dart';

Future<void> main() async {
  await DartVLC.initialize(useFlutterNativeView: true);
  runApp(const FluentApp(home: CustomPlayer()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      content: Center(
        child: CustomPlayer(),
      ),
    );
  }
}

class CustomPlayer extends StatefulWidget {
  const CustomPlayer({Key? key}) : super(key: key);

  @override
  State<CustomPlayer> createState() => _CustomPlayerState();
}

class _CustomPlayerState extends State<CustomPlayer> {
  final _player = Player(id: 69420, registerTexture: false);

  final media = Media.network(
      'rtsp://root:kia7171@192.168.2.130/axis-media/media.amp?camera=1');

  @override
  void initState() {
    super.initState();
    _player.open(
      media,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NativeVideo(
        fit: BoxFit.cover,
        player: _player,
        height: 450.0,
        width: 800.0,
        showControls: false);
  }
}
