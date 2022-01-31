//
//  ChatView.swift
//  Practice-ChatApp-SwiftUI
//
//  Created by Stanley Miller on 1/31/22.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    @State private var text = ""
    @State private var messageID: UUID?
    @FocusState private var isFocused
    
    let chat: Chat
    private let columns = [
        GridItem(.flexible(minimum: 10))
    ]
    
    var body: some View {
        VStack {
            GeometryReader { reader in
                ScrollView {
                    ScrollViewReader { scrollReader in
                        fetchMessagesView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageID) { _ in
                                if let messageID = messageID {
                                    scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                }
                            }
                        //Auto scroll to last sent message
                            .onAppear {
                                if let messageID = chat.messages.last?.id {
                                    scrollTo(messageID: messageID, anchor: .bottom, shouldAnimate: false, scrollReader: scrollReader)
                                }
                            }
                    }
                }
            }
            .padding(.bottom, 5)
            
            toolBarView()
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: navBarLeadingButton, trailing: navBarTrailingButton)
        .onAppear {
            viewModel.markAsUnread(false, chat: chat)
        }
    }
    
    var navBarLeadingButton: some View {
        Button {
            
        } label: {
            HStack {
                Image(chat.person.imageString)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text(chat.person.name)
                    .bold()
            }
            .foregroundColor(.black.opacity(0.85))
        }

    }
    
    var navBarTrailingButton: some View {
        HStack {
            Button {
                print("Did Tap Video Icon")
            } label: {
                Image(systemName: "video")
                    .foregroundColor(.purple)
            }
            
            Button {
                print("Did Tap Phone Icon")
            } label: {
                Image(systemName: "phone")
                    .foregroundColor(.purple)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(chat: Chat.sampleChats[0])
                .environmentObject(ChatViewModel())
        }
    }
}

//MARK: - Helpers
extension ChatView {
    private func fetchMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0, pinnedViews: [.sectionHeaders]) {
            
            let sectionMessages = viewModel.fetchSectionMessages(for: chat)
            
            ForEach(sectionMessages.indices, id: \.self) { sectionIndex in
                
                let messages = sectionMessages[sectionIndex]
                
                Section(header: sectionHeader(firstMessage: messages.first!)) {
                    ForEach(messages) { message in
                        
                        let isReceivedMessage = message.type == .received
                        
                        HStack {
                            ZStack {
                                Text(message.text)
                                    .padding(.horizontal)
                                    .padding(.vertical, 12)
                                    .background(isReceivedMessage ? Color(red: 111/255, green: 232/255, blue: 172/255).opacity(0.8) : .purple.opacity(0.7))
                                    .cornerRadius(12)
                                    .foregroundColor(isReceivedMessage ? Color.black : Color.white.opacity(1.5))
                            }
                            .frame(width: viewWidth * 0.7, alignment: isReceivedMessage ? .leading : .trailing)
                            .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity, alignment: isReceivedMessage ? .leading : .trailing)
                        .id(message.id) // Important for automatic scrolling
                    }
                }
            }
        }
    }
    
    private func sectionHeader(firstMessage message: Message) -> some View {
        ZStack {
            Text(message.date.descriptiveString(dateStyle: .medium))
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .frame(width: 120)
                .padding(.vertical, 5)
                .background(Color.purple)
                .cornerRadius(12)
        }
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
    }
    
    private func toolBarView() -> some View {
        VStack {
            let height: CGFloat = 37
            
            HStack {
                TextField("Message...", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .focused($isFocused)
                
                Button {
                    sendMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                            Circle()
                                .foregroundColor(text.isEmpty ? .gray : .purple)
                        )
                    
                    
                }
                .disabled(text.isEmpty)
                
            }
            .frame(height: height)
            
        }
        .padding()
        .background(.thickMaterial)
    }
    
    private func sendMessage() {
        if let message = viewModel.sendMessage(text, in: chat) {
            text = ""
            messageID = message.id
        }
    }
    
    private func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool, scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
}
