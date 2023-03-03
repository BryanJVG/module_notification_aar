
class Twit {
    Twit({
        required this.id,
        required this.user,
        required this.name,
        required this.message,
        required this.image,
        required this.reactionBanner,
    });

    int id;
    String user;
    String name;
    String message;
    String image;
    ReactionBanner reactionBanner;

    factory Twit.fromJson(Map<String, dynamic> json) => Twit(
        id: json["id"],
        user: json["user"],
        name: json["name"],
        message: json["message"],
        image: json["image"],
        reactionBanner: ReactionBanner.fromJson(json["reaction_banner"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "name": name,
        "message": message,
        "image": image,
        "reaction_banner": reactionBanner.toJson(),
    };
}


class ReactionBanner {
    ReactionBanner({
        required this.favorites,
        required this.messsages,
        required this.sharings,
    });

    List<Favorite> favorites;
    List<Message> messsages;
    List<Sharing> sharings;

    factory ReactionBanner.fromJson(Map<String, dynamic> json) => ReactionBanner(
        favorites: List<Favorite>.from(json["favorites"].map((x) => Favorite.fromJson(x))),
        messsages: List<Message>.from(json["messsages"].map((x) => Message.fromJson(x))),
        sharings: List<Sharing>.from(json["sharing"].map((x) => Sharing.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "favorites": List<dynamic>.from(favorites.map((x) => x.toJson())),
        "messsages": List<dynamic>.from(messsages.map((x) => x.toJson())),
        "sharing": List<dynamic>.from(sharings.map((x) => x.toJson())),
    };
}


class Favorite {
    Favorite({
        required this.user,
        required this.name,
    });

    String user;
    String name;

    factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        user: json["user"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
    };
}

class Message {
    Message({
        required this.id,
        required this.user,
        required this.name,
        required this.message,
        required this.image,
    });

    int id;
    String user;
    String name;
    String message;
    String image;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        user: json["user"],
        name: json["name"],
        message: json["message"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "name": name,
        "message": message,
        "image": image,
    };
}



class Sharing {
    Sharing({
        required this.user,
        required this.name,
    });

    String user;
    String name;

    factory Sharing.fromJson(Map<String, dynamic> json) => Sharing(
        user: json["user"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
    };
}
