class Link {
  Link({this.id, this.type});

  final String id;
  final String type;

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
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
