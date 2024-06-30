import 'package:flutter/material.dart';

class DictionaryView extends StatefulWidget {
  const DictionaryView({Key? key}) : super(key: key);
  static String id = 'dictionaryView';

  @override
  _DictionaryViewState createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  TextEditingController controller = TextEditingController();
  List<String> sentences = [
    'محمد رسول الله',
    'السلام عليكم',
    'إذا انفض الناس عن غزة وملوا من أخبارها فلا تتخلى عنها حتى لو بقيت وحدك لازم تدعمه',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void addSentence(String sentence) {
    setState(() {
      sentences.add(sentence);
    });
  }

  void search(String query) {
    // Implement your search logic here
    // For simplicity, let's just print the results for now
    List<String> results = sentences
        .where(
            (sentence) => sentence.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print('Search results for "$query": $results');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القاموس'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              ':الجمل المضافة حديثا',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'أضف جملة جديدة',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    addSentence(controller.text);
                    controller.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sentences.length,
                itemBuilder: (context, index) {
                  return buildSentenceCard(context, sentences[index]);
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildSentenceCard(BuildContext context, String sentence) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          sentence,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pop(context, sentence);
        },
      ),
    );
  }
}
