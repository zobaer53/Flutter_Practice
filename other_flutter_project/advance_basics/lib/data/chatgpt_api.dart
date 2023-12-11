import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGPTService {
  final String apiKey; // Replace with your ChatGPT API key

  ChatGPTService({required this.apiKey});

  Future<String> generatePrompt(String option) async {
    const apiUrl = 'https://api.openai.com/v1/completions'; // Replace with the appropriate API endpoint

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final prompt = 'User selected option: $option\n\n${getQuestionsPrompt(option)}';

    final body = jsonEncode({
      'prompt': prompt,
      'temperature': 0.7,
      'max_tokens': 150,
      'top_p': 1.0,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
      'model':'gpt-3.5-turbo-instruct',
    });

    final response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final generatedText = data['choices'][0]['text'];
      return generatedText;
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to generate prompt. Status code: ${response.statusCode}');
    }
  }

  String getQuestionsPrompt(String option) {
    // Customize this method based on your requirements to generate prompts for different options.
    // This is just a simple example.
    if (option == 'Widgets') {
      return 'Ask a question related to Widgets:\n\n';
    } else if (option == 'StatefulWidget') {
      return 'Ask a question related to StatefulWidget:\n\n';
    }
    // Add more conditions based on your quiz options.

    return ''; // Default prompt
  }
}
