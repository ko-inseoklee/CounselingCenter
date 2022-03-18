class Board {
  final int id;
  final String title;
  final String contents;
  final int likes;

  Board({required this.id,required this.title,required this.contents,required this.likes});

  factory Board.fromJson(Map json){
    return Board(
        id: json['today'],
        title: json['title'],
        contents: json['contents'],
        likes: json['likecnt']
    );
  }
}