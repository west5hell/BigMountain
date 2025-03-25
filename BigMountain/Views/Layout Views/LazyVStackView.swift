//
//  LazyVStackView.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct LazyVStack_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "LazyVStack",
                subtitle: "Introduction",
                desc: "When using the LazyVStack by itself, you won't notice much of a difference from the VStack."
            )
                .layoutPriority(1)
            
            Text("LazyVStack")
            LazyVStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("VStack")
            VStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("Notice the LazyVStack pushes out horizontally. (No Spacers being used here.")
        }
        .font(.title)
    }
}

#Preview {
    LazyVStack_Intro()
}

struct LazyVStack_Alignment: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(
                "LazyVStack",
                subtitle: "Alignment",
                desc: "Since LazyVStack are push-out views (horizontally) the alignment parameter could be useful."
            )
            
            Text("Leading")
            
            LazyVStack(alignment: .leading, spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            Text("Trailing")
            
            LazyVStack(alignment: .trailing, spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
        }
        .font(.title)
    }
}

#Preview("Alignment", body: {
    LazyVStack_Alignment()
})

struct Person: Identifiable {
    let id: UUID
    let imageName: String // 用于加载图片
}

struct Data {
    struct Team: Identifiable {
        let id: UUID
        let imageName: String // 队伍的 SF Symbols 图标名称
        let people: [Person]  // 队伍成员列表
        
        init(id: UUID = UUID(), imageName: String, people: [Person]) {
            self.id = id
            self.imageName = imageName
            self.people = people
        }
    }
    
    static func getTeams() -> [Team] {
        return [
            Team(
                imageName: "person.3.fill",
                people: [
                    Person(id: UUID(), imageName: "person.circle"),
                    Person(id: UUID(), imageName: "person.circle.fill")
                ]
            ),
            Team(
                imageName: "person.2.fill",
                people: [
                    Person(id: UUID(), imageName: "person.crop.square"),
                    Person(id: UUID(), imageName: "person.crop.circle")
                ]
            )
        ]
    }
}

struct LazyVStack_WithScrolling: View {
    @State private var teams = Data.getTeams()
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView()
            
            ScrollView {
                LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    ForEach(teams) { team in
                        Section {
                            ForEach(team.people) { person in
                                Image(systemName: "\(person.imageName)")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                            }
                        } header: {
                            TeamVerticalHeaderView(team: team)
                        } footer: {
                            TeamVerticalFooterView(team: team)
                        }
                    }
                }
            }
            Spacer()
        }
        .font(.title)
    }
}

struct TeamVerticalHeaderView: View {
    var team: Data.Team
    
    var body: some View {
        HStack {
            Text("Team")
                .font(.largeTitle)
            Image(systemName: team.imageName)
                .font(.largeTitle)
        }
        .frame(width: 300, height: 75)
        .background(
            Rectangle()
                .fill(Color.yellow)
                .opacity(0.9)
        )
    }
}

struct TeamVerticalFooterView: View {
    var team: Data.Team
    
    var body: some View {
        HStack {
            Text("Team Total: ")
                .font(.title)
            Image("\(team.people.count)")
                .font(.title)
                .fontWeight(.bold)
        }
        .frame(width: 300, height: 50)
        .background(
            Rectangle()
                .fill(Color.yellow)
                .opacity(0.9)
        )
    }
}

#Preview("ScrollView", body: {
    LazyVStack_WithScrolling()
})
