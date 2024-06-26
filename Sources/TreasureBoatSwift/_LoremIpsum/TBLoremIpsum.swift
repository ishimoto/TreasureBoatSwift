//
//  TBLoremIpsum.swift
//
//  Created by Alex Nagy on 17.06.2022.
//

import Foundation

/// Adds Lorem Ipsum text
public struct TBLoremIpsum {
    
    public static let atExtraExtraExtraShort = "@lorem"
    
    public static let atExtraExtraShort = "@lorem_ipsum"
    
    public static let extraExtraExtraShort = "Lorem"
    
    public static let extraExtraShort = "Lorem ipsum"
    
    public static let extraShort = "Lorem ipsum dolor sit amet."
    
    public static let short = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    
    public static let medium = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    
    public static let normal = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    public static let long = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
    
    public static let extraLong = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
    
    public static let oneParagraph =
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """
    
    public static let twoParagraphs =
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
    """
    
    public static let threeParagraphs =
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
    At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.
    """
    
    public static let names = [
        "Mario Speedwagon",
        "Petey Cruiser",
        "Anna Sthesia",
        "Paul Molive",
        "Anna Mull",
        "Gail Forcewind",
        "Paige Turner",
        "Bob Frapples",
        "Walter Melon",
        "Nick R. Bocker",
        "Barb Ackue",
        "Buck Kinnear",
        "Greta Life",
        "Ira Membrit",
        "Shonda Leer",
        "Brock Lee",
        "Maya Didas",
        "Rick O'Shea",
        "Pete Sariya",
        "Monty Carlo",
        "Sal Monella",
        "Sue Vaneer",
        "Cliff Hanger",
        "Barb Dwyer",
        "Terry Aki",
        "Cory Ander",
        "Robin Banks",
        "Jimmy Changa",
        "Barry Wine",
        "Wilma Mumduya",
        "Buster Hyman",
        "Poppa Cherry",
        "Zack Lee",
        "Don Stairs",
        "Saul T. Balls",
        "Peter Pants",
        "Hal Appeno",
        "Otto Matic",
        "Moe Fugga",
        "Graham Cracker",
        "Tom Foolery",
        "Al Dente",
        "Bud Wiser",
        "Polly Tech",
        "Holly Graham",
        "Frank N. Stein",
        "Cam L. Toe",
        "Pat Agonia",
        "Tara Zona",
        "Barry Cade",
        "Phil Anthropist",
        "Marvin Gardens",
        "Phil Harmonic",
        "Arty Ficial",
        "Will Power",
        "Donatella Nobatti",
        "Juan Annatoo",
        "Stew Gots",
        "Anna Rexia",
        "Bill Emia",
        "Curt N. Call",
        "Max Emum",
        "Minnie Mum",
        "Bill Yerds",
        "Hap E. Birthday",
        "Matt Innae",
        "Polly Science",
        "Tara Misu",
        "Ed U. Cation",
        "Gerry Atric",
        "Kerry Oaky",
        "Midge Itz",
        "Gabe Lackmen",
        "Mary Christmas",
        "Dan Druff",
        "Jim Nasium",
        "Angie O. Plasty",
        "Ella Vator",
        "Sal Vidge",
        "Bart Ender",
        "Artie Choke",
        "Hans Olo",
        "Marge Arin",
        "Hugh Briss",
        "Gene Poole",
        "Ty Tanic",
        "Manuel Labor",
        "Lynn Guini",
        "Claire Voyant",
        "Peg Leg",
        "Jack E. Sack",
        "Marty Graw",
        "Ash Wednesday",
        "Olive Yu",
        "Gene Jacket",
        "Tom Atoe",
        "Doug Out",
        "Sharon Needles",
        "Beau Tie",
        "Serj Protector",
        "Marcus Down",
        "Warren Peace",
        "Bud Jet",
        "Barney Cull",
        "Marion Gaze",
        "Eric Shun",
        "Mal Practice",
        "Ed Itorial",
        "Rick Shaw",
        "Paul Issy",
        "Ben Effit",
        "Kat E. Gory",
        "Justin Case",
        "Louie Z. Ana",
        "Aaron Ottix",
        "Ty Ballgame",
        "Anne Fibbiyon",
        "Barry Cuda",
        "John Withawind",
        "Joe Thyme",
        "Mary Goround",
        "Marge Arita",
        "Frank Senbeans",
        "Bill Dabear",
        "Ray Zindaroof",
        "Adam Zapple",
        "Lewis N. Clark",
        "Matt Schtick",
        "Sue Shee",
        "Chris P. Bacon",
        "Doug Lee Duckling",
        "Mason Protesters",
        "Sil Antro",
        "Cal Orie",
        "Sara Bellum",
        "Al Acart",
        "Marv Ellis",
        "Evan Shlee",
        "Terry Bull",
        "Mort Ission",
        "Mark Ette",
        "Ken Tucky",
        "Louis Ville",
        "Colin Oscopy",
        "Fred Attchini",
        "Al Fredo",
        "Penny Tration",
        "Reed Iculous",
        "Chip Zinsalsa",
        "Matt Uhrafact",
        "Jack Dup",
        "Mike Roscope",
        "Lou Sinclark",
        "Faye Daway",
        "Javy Cado",
        "Tom Ollie",
        "Sam Buca",
        "Phil Anderer",
        "Sam Owen",
        "Mary Achi",
        "Ray Cyst",
        "Curtis E. Flush",
        "Holland Oats",
        "Helen Highwater",
        "Eddy Kitt",
        "Al Toesacks",
        "Sir Kim Scision",
        "Elle Bowdrop",
        "Yu Tube",
        "Ellis Dee",
        "Anna Lytics",
        "Penny Trate",
        "Phil Erup",
        "Jenna Side",
        "Mary Nara",
        "Mick Donalds",
        "Amber Alert",
        "Vic Tory",
        "Bobby Pin",
        "Dom Inate",
        "Hugh Miliation",
        "Christian Mingle",
        "Juan Soponatime",
        "Dante Sinferno",
        "Ed Zupp",
        "Sarah Yevo",
        "Jess Thetip",
        "Arthur Itis",
        "Faye Sbook",
        "Carrie R. Pigeon",
        "Rachel Slurs",
        "Ty Pryder",
        "Cole Slaw",
        "Pat Ernity",
        "Deb Utant",
        "Luke Warm",
        "Travis Tee",
        "Clara Fication",
        "Paul Itician"]
    
    public static func randomName() -> String {
        names.randomElement() ?? "Paul Itician"
    }
    
    public static let texts = [
        extraExtraExtraShort,
        extraExtraShort,
        extraShort,
        short,
        medium,
        normal,
        long,
        extraLong,
        oneParagraph,
        twoParagraphs,
        threeParagraphs
    ]
    
    public static func randomText() -> String {
        texts.randomElement() ?? extraExtraExtraShort
    }
    
    public static func amount(_ value: Int = randomInt(), 
                                multiplier: ETBLoremIpsumAmountMultiplier = .none,
                                type: ETBLoremIpsumAmountType = .none) -> String {
        "\(value)\(multiplier.rawValue)\(type != .none ? " \(type.rawValue)" : "")"
    }
    
    public static func secondsAgo(_ value: Int = randomInt(59), isShort: Bool = true) -> String {
        if isShort {
            return "\(value)s ago"
        } else {
            return "\(value) second\(value == 1 ? "" : "s") ago"
        }
    }
    
    public static func minutesAgo(_ value: Int = randomInt(59), isShort: Bool = true) -> String {
        if isShort {
            return "\(value)m ago"
        } else {
            return "\(value) minute\(value == 1 ? "" : "s") ago"
        }
    }
    
    public static func hoursAgo(_ value: Int = randomInt(24), isShort: Bool = true) -> String {
        if isShort {
            return "\(value)h ago"
        } else {
            return "\(value) hour\(value == 1 ? "" : "s") ago"
        }
    }
    
    public static func daysAgo(_ value: Int = randomInt(30), isShort: Bool = true) -> String {
        if isShort {
            return "\(value)d ago"
        } else {
            return "\(value) day\(value == 1 ? "" : "s") ago"
        }
    }
    
    public static func weeksAgo(_ value: Int = randomInt(3), isShort: Bool = true) -> String {
        if isShort {
            return "\(value)w ago"
        } else {
            return "\(value) week\(value == 1 ? "" : "s") ago"
        }
    }
    
    public static func monthsAgo(_ value: Int = randomInt(11), isShort: Bool = true) -> String {
        if isShort {
            return "\(value)mo ago"
        } else {
            return "\(value) month\(value == 1 ? "" : "s") ago"
        }
    }
    
    public static func yearsAgo(_ value: Int = randomInt(9), isShort: Bool = true) -> String {
        if isShort {
            return "\(value)yr ago"
        } else {
            return "\(value) year\(value == 1 ? "" : "s") ago"
        }
    }
    
    public static func now() -> String {
        "now"
    }
    
    public static func randomInt(_ max: Int = 99) -> Int {
        (1...max).randomElement() ?? 0
    }
    
    public static func randomNumber() -> String {
        "\(randomInt())"
    }
}

public enum ETBLoremIpsumAmountMultiplier: String {
    case none = ""
    case K = "K"
    case M = "M"
}

public enum ETBLoremIpsumAmountType: String {
    case none = ""
    case likes = "likes"
    case views = "views"
    case comments = "comments"
    case followers = "followers"
    case following = "following"
    case subscribers = "subscibers"
    case replies = "replies"
}
