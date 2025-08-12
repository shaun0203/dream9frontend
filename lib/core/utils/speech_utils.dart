import 'package:speech_to_text/speech_to_text.dart';

class SpeechUtils {
  final SpeechToText _speech = SpeechToText();
  
  Future<bool> initialize() async {
    return await _speech.initialize();
  }

  Stream<String> listen() {
    final controller = StreamController<String>();
    
    _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          controller.add(result.recognizedWords);
        }
      },
    );
    
    return controller.stream;
  }
}