enum MessageTypes {
  text,
  media,
  location,
  post;

  static MessageTypes parse(String value, {MessageTypes? defaultValue}) {
    for (MessageTypes type in MessageTypes.values) {
      if (type.toString() == value) return type;
    }
    return defaultValue ?? MessageTypes.text;
  }

  @override
  String toString() {
    switch (this) {
      case MessageTypes.text:
        return "text";
      case MessageTypes.media:
        return "media";
      case MessageTypes.location:
        return "location";
      case MessageTypes.post:
        return "post";
    }
  }
}
