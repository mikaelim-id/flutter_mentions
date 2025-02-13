part of flutter_mentions;

class OptionList extends StatelessWidget {
  OptionList({
    required this.data,
    required this.onTap,
    required this.suggestionListHeight,
    this.suggestionBuilder,
    this.suggestionListDecoration,
    this.backgroundColor,
    this.optionTextStyle,
    this.imageBuilder,
  });

  final Widget Function(Map<String, dynamic>)? suggestionBuilder;

  final List<Map<String, dynamic>> data;

  final Function(Map<String, dynamic>) onTap;

  final double suggestionListHeight;

  final BoxDecoration? suggestionListDecoration;

  final Color? backgroundColor;

  final TextStyle? optionTextStyle;

  final Widget Function(String imageURL, String initial)? imageBuilder;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            decoration:
                suggestionListDecoration ?? BoxDecoration(color: Colors.white),
            constraints: BoxConstraints(
              maxHeight: suggestionListHeight,
              minHeight: 0,
            ),
            margin: EdgeInsets.only(bottom: 10),
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: data[index]['id'] != '@all'
                      ? () {
                          onTap(data[index]);
                        }
                      : null,
                  child: suggestionBuilder != null
                      ? suggestionBuilder!(data[index])
                      : Container(
                          color: backgroundColor ?? Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              imageBuilder != null &&
                                      data[index]['id'] != '@all'
                                  ? imageBuilder!(data[index]['image_url'],
                                      data[index]['initial'])
                                  : SizedBox(),
                              Text(
                                data[index]['display'],
                                style:
                                    optionTextStyle ?? TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                );
              },
            ),
          )
        : Container();
  }
}
