import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tags/flutter_tags.dart';

class GenreMovie extends StatelessWidget {
  const GenreMovie({
    Key key,
    @required List<String> items,
    Color textColor,
    Color borderColor,
  })  : _items = items,
        _textColor = textColor,
        _borderColor = borderColor,
        super(key: key);

  final List<String> _items;
  final Color _textColor;
  final Color _borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Tags(
        itemCount: _items.length, // required
        itemBuilder: (int index) {
          final item = _items[index];
          return ItemTags(
            key: Key(index.toString()),
            index: index, // required
            title: item,
            active: false,
            textStyle: TextStyle(fontSize: 12),
            elevation: 0,
            textColor: _textColor ?? AppStyle.getColor(ThemeColor.primary),
            border: Border.all(
              color: _borderColor ?? AppStyle.getColor(ThemeColor.primary),
            ),
            pressEnabled: false,
            onLongPressed: null,
          );
        },
      ),
    );
  }
}
