class AvatarReference {
  AvatarReference(this.url);
  final String url;

  factory AvatarReference.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String url = data['url'];
    if (url == null) {
      return null;
    }
    return AvatarReference(url);
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }
}
