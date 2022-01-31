//
//  Chat.swift
//  Practice-ChatApp-SwiftUI
//
//  Created by Stanley Miller on 1/31/22.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}

extension Chat {
    
    static let sampleChats = [
        Chat(person: Person(name: "Jazz", imageString: "Image01"), messages: [
            Message("Hey buddy", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Creating an chat app and it's hard to create a fake chat conversation. Can you help me out>", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Por favor sir", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Sure, how can I help?", type: .received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Maybe you send some jokes?", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("I can handle that, no problem", type: .received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("What do you call a fish with no eyes?", type: .received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Shrug emojii", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("A fsh", type: .received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("...dead emojii", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Let me try...", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("There are 10 types of people in this world, those who understand binary and those who don't.", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Tear.Ra.Bowl", type: .received, date: Date()),
        ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "Vlad", imageString: "Image06"), messages: [
            Message("Hey Vlad, how's bootcamp going?", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("Going great flo, just finished my first app, still alot to learn but coding is fun.", type: .received, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("What type of app??", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Table App. Coded it entirely in SwiftUI.", type: .received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Big question now is if I should start a junior dev gig or develop for fun", type: .received, date: Date()),
        ]),
        
        Chat(person: Person(name: "Larry", imageString: "Image07"), messages: [
            Message("Hey Sensei", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Can you show me some new Meditation exercises? The last one was helpful.", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Sure thing flo, have you tested the mindful breathing techniques yet?", type: .received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("No, what's that??", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("This technique can increase your energy and help you feel more alert.", type: .received, date: Date()),
        ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "Dawn", imageString: "Image08"), messages: [
            Message("Yo Dawn, you from Germany", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Hey Flo, indeed I am.", type: .received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Ohh that's cool, how's your dev journey going?", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("SwiftUI is just amazing, coding is so fast and elegant. I've completed the 100 days of SwiftUI from Paul Hudson. Great course, learned so much.", type: .received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Nice. Congrats on completing the course. You're absolutely right, coding in SwiftUI is superb. Unbelieve how much you can do in a few lines of code.", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("SwiftUI is a real game changer for iOS development.", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
        ]),
        
        Chat(person: Person(name: "Sandy", imageString: "Image02"), messages: [
            Message("Mornin, what you doing?", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("Learning some SwiftUI. You heard of Hacking with SwiftUI?", type: .received, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("Oh yeah, awesome course. I've completed it and I can fully recommend it as well.", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
        ]),
        
        Chat(person: Person(name: "Willow", imageString: "Image03"), messages: [
            Message("Hey Wayne, just wanted to thank you for your continued Patreon support.", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Happy Holidays!", type: .sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
        ])
    ]
    
}
