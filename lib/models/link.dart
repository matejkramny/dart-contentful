class ContentfulLink {
  ContentfulLink({this.id, this.type});

  final String id;
  final String type;

  factory ContentfulLink.fromJson(Map<String, dynamic> json) {
    return ContentfulLink(
      id: json['sys']['id'],
      type: json['sys']['linkType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'sys': {
          'type': 'Link',
          'linkType': type,
          'id': id,
        },
      };
}
