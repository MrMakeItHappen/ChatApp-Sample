//
//  MessagesView.swift
//  Practice-ChatApp-SwiftUI
//
//  Created by Stanley Miller on 1/31/22.
//

import SwiftUI

struct MessagesView: View {
    @State private var query = ""
    @StateObject var viewModel = ChatViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.fetchSortedFilteredChats(query: query)) { chat in
                    //Hide disclosure arrow. Optional.
                    ZStack {
                        MessageRow(chat: chat)
                        
                        NavigationLink {
                            ChatView(chat: chat)
                                .environmentObject(viewModel)
                        } label: {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            viewModel.markAsUnread(!chat.hasUnreadMessage, chat: chat)
                        } label: {
                            if chat.hasUnreadMessage {
                                Label("Read", systemImage: "text.bubble")
                            } else {
                                Label("Unread", systemImage: "bubble.left.and.exclamationmark.bubble.right")
                            }
                        }
                        .tint(.purple)

                    }
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Chats")
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image(systemName: "square.and.pencil")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
