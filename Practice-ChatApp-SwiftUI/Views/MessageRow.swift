//
//  MessageRow.swift
//  Practice-ChatApp-SwiftUI
//
//  Created by Stanley Miller on 1/31/22.
//

import SwiftUI

struct MessageRow: View {
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 20) {
            Image(chat.person.imageString)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            ZStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(chat.person.name)
                            .bold()
                        
                        Spacer()
                        
                        Text(chat.messages.last?.date.descriptiveString() ?? "")
                    }
                    
                    HStack {
                        Text(chat.messages.last?.text ?? "")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                    }
                }
                
                Circle()
                    .foregroundColor(chat.hasUnreadMessage ? .purple : .clear)
                    .frame(width: 16, height: 16)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .frame(height: 80)
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(chat: Chat.sampleChats[0])
    }
}
