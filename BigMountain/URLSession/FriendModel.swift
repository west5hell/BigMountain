import SwiftData
import SwiftUI

@Model
class FriendModel {
    var firstName: String
    var lastName: String
    var imageUrl: String

    @Attribute(.externalStorage)
    var image: Data?

    init(
        firstName: String,
        lastName: String,
        imageUrl: String = "",
        image: Data? = nil
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.imageUrl = imageUrl
        self.image = image
    }
}

extension FriendModel {

    var viewName: PersonNameComponents {
        PersonNameComponents(givenName: firstName, familyName: lastName)
    }

    var viewImage: UIImage {
        guard let image else {
            return UIImage(resource: .earth)
        }
        return UIImage(data: image) ?? UIImage(resource: .earth)
    }
}

extension FriendModel {
    @ModelActor
    actor BackgroundActor {
        struct Friends: Codable {
            var users: [Friend]

            struct Friend: Codable {
                var firstName: String
                var lastName: String
                var image: String
            }
        }

        func importFriends() async throws {
            guard let url = URL(string: "https://dummyjson.com/users") else {
                fatalError("There is a problem with the API URL.")
            }

            do {
                let (data, _) = try await URLSession.shared.getData(for: url)

                let friends = try JSONDecoder().decode(Friends.self, from: data)

                for friend in friends.users {
                    let friendModel = FriendModel(
                        firstName: friend.firstName,
                        lastName: friend.lastName,
                        imageUrl: friend.image
                    )
                    modelContext.insert(friendModel)
                }

                try modelContext.save()

                await downloadImages()
            } catch {
                throw error
            }
        }

        func downloadImages() async {
            let filter = #Predicate<FriendModel> { $0.image == nil }
            guard
                let friendsWithoutImages = try? modelContext.fetch(
                    FetchDescriptor(predicate: filter)
                )
            else { return }

            for friend in friendsWithoutImages {
                guard let url = URL(string: friend.imageUrl) else { break }
                do {
                    let (data, _) = try await URLSession.shared.getData(
                        for: url
                    )
                    friend.image = data
                } catch {
                    print(
                        "Error getting image for: \(friend.imageUrl). Error: \(error.localizedDescription)"
                    )
                }
            }
            do {
                try modelContext.save()
            } catch {
                print("Error saving images: \(error.localizedDescription)")
            }
        }
    }
}

extension URLSession {
    public nonisolated func getData(for request: URLRequest) async throws -> (
        Data, URLResponse
    ) {
        try await data(for: request)
    }

    public nonisolated func getData(for url: URL) async throws -> (
        Data, URLResponse
    ) {
        try await data(from: url)
    }
}
