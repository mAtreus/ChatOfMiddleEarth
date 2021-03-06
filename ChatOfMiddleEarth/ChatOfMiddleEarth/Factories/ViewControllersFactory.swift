//
//  ViewControllerFactory.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation
import Socket
import Domain

protocol ViewControllersFactory: AnyObject {
    func makeLoginViewController(withCoordinator coordinator: MainCoordinator) -> LoginViewController
    func makeFellowshipViewController(withCoordinator coordinator: MainCoordinator,
                                      username:String,
                                      port: String) -> FellowshipViewController
    func makeChatViewController(withCoordinator coordinator: MainCoordinator,
                                andFriend friend: String) -> ChatViewController
}

class ViewControllersFactoryImplementation: ViewControllersFactory {
    
    let presenterFactory:PresenterFactory
    
    init(presenterFactory: PresenterFactory) {
        self.presenterFactory = presenterFactory
    }

    func makeLoginViewController(withCoordinator coordinator: MainCoordinator) -> LoginViewController {
        let presenter = presenterFactory.makeLoginPresenter(withCoordinator: coordinator)
        let loginVC = LoginViewController(presenter: presenter)
        return loginVC
    }
    
    func makeFellowshipViewController(withCoordinator coordinator: MainCoordinator,username:String,port: String) -> FellowshipViewController{
        let presenter = presenterFactory.makeFellowshipPresenter(withCoordinator: coordinator,
                                                                 username: username,
                                                                 port: port)
        let fellowshipVC = FellowshipViewController(presenter: presenter)
        return fellowshipVC
    }
    
    func makeChatViewController(withCoordinator coordinator: MainCoordinator,
                                andFriend friend: String) -> ChatViewController {

        let presenter = presenterFactory.makeChatPresenter(withCoordinator: coordinator, withFriend: friend)
        let chatVC = ChatViewController(presenter: presenter)
        return chatVC
    }
}
