//
//  ChatRoomProtocol.swift
//  Socket
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

protocol ChatRoomInterface {
    
    func setupNetworkCommunication()
    func joinChat(username:String)
    func send(message: String)
    func stopChatSession()

}