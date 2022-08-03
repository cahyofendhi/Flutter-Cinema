import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/widgets.dart';

class GenreMovie extends StatelessWidget {
  const GenreMovie({
    Key? key,
    required List<String> items,
    Color? textColor,
    Color? borderColor,
  })  : _items = items,
        _textColor = textColor,
        _borderColor = borderColor,
        super(key: key);

  final List<String> _items;
  final Color? _textColor;
  final Color? _borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Wrap(
        spacing: 8,
        children: _items
            .map(
              (e) => Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(
                      color: _borderColor ??
                          AppStyle.getColor(ThemeColor.primary)),
                ),
                child: Text(
                  e,
                  style: TextStyle(
                      fontSize: 12,
                      color:
                          _textColor ?? AppStyle.getColor(ThemeColor.primary)),
                ),
              ),
            )
            .toList(),
      ),
    );
    //   Tags(
    //     itemCount: _items.length, // required
    //     itemBuilder: (int index) {
    //       final item = _items[index];
    //       return ItemTags(
    //         key: Key(index.toString()),
    //         index: index, // required
    //         title: item,
    //         active: false,
    //         textStyle: TextStyle(fontSize: 12),
    //         elevation: 0,
    //         textColor: _textColor ?? AppStyle.getColor(ThemeColor.primary),
    //         border: Border.all(
    //           color: _borderColor ?? AppStyle.getColor(ThemeColor.primary),
    //         ),
    //         pressEnabled: false,
    //         onLongPressed: null,
    //       );
    //     },
    //   ),
    // );
  }
}
