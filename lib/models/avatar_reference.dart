class AvatarReference {
  AvatarReference(this.downloadUrl);
  final String downloadUrl;

  factory AvatarReference.fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      return AvatarReference("https://homepages.cae.wisc.edu/~ece533/images/watch.png");
    }
    final String? downloadUrl = data['downloadUrl'];
    if (downloadUrl == null) {
      return AvatarReference("https://homepages.cae.wisc.edu/~ece533/images/watch.png");
    }
    return AvatarReference(downloadUrl);
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
    };
  }
}
