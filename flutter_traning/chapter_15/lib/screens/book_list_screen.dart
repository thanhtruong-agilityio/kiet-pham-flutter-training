import 'package:flutter/material.dart';
import '/models/book.dart';
import '/data/http_helper.dart';

class BookListScreen extends StatefulWidget {
  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<Color> bgColors = [];
  List<Book> books = [];
  bool? isLargeScreen;

  @override
  void initState() {
    super.initState();
    HttpHelper helper = HttpHelper();
    helper.getFlutterBooks().then((List<Book> value) {
      setState(() {
        books = value;
      });
    });
    helper.getFlutterBooks().then((List<Book> value) {
      int i;
      for (i = 0; i < value.length; i++) {
        bgColors.add(Colors.white);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Flutter Books")),
      body: GridView.count(
        childAspectRatio: isLargeScreen! ? 8 : 5,
        crossAxisCount: isLargeScreen! ? 2 : 1,
        children: List.generate(
          books.length,
          (index) {
            return GestureDetector(
              child: Container(
                color: bgColors.isNotEmpty ? bgColors[index] : Colors.white,
                child: ListTile(
                  title: Text(books[index].title),
                  subtitle: Text(books[index].authors),
                  leading: CircleAvatar(
                    backgroundImage: (books[index].thumbnail) == ""
                        ? null
                        : NetworkImage(books[index].thumbnail!),
                  ),
                ),
              ),
              onTap: () => setColor(Colors.lightBlue, index),
              onSecondaryTap: () => setColor(Colors.white, index),
              onLongPress: () => setColor(Colors.white, index),
            );
          },
        ),
      ),
    );
  }

  void setColor(Color color, int index) {
    setState(() {
      bgColors[index] = color;
    });
  }
}
