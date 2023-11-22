enum Direction {
  east,
  west,
  south,
  north,
  northEast,
  northWest,
  southEast,
  southWest;

  static Direction parse(String value) {
    for (Direction direction in Direction.values) {
      if (direction.toString() == value) return direction;
    }
    throw Exception("Can't parse Direction! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case Direction.east:
        return "east";
      case Direction.west:
        return "west";
      case Direction.south:
        return "south";
      case Direction.north:
        return "north";
      case Direction.northEast:
        return "north_east";
      case Direction.northWest:
        return "north_west";
      case Direction.southEast:
        return "south_east";
      case Direction.southWest:
        return "south_west";
    }
  }

  static String getStringVi(String value) {
    switch (value) {
      case "east":
        return "Đông";
      case "west":
        return "Tây";
      case "south":
        return "Nam";
      case "north":
        return "Bắc";
      case "north_east":
        return "Đông Bắc";
      case "north_west":
        return "Tây Bắc";
      case "south_east":
        return "Đông Nam";
      case "south_west":
        return "Tây Nam";
    }
    return value;
  }

  // tomap
  static Map<Direction, String> toMap() {
    return {
      Direction.east: 'Đông',
      Direction.west: 'Tây',
      Direction.south: 'Nam',
      Direction.north: 'Bắc',
      Direction.northEast: 'Đông Bắc',
      Direction.northWest: 'Tây Bắc',
      Direction.southEast: 'Đông Nam',
      Direction.southWest: 'Tây Nam',
    };
  }
}
