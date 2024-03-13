//
//  MainVm.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 10/03/24.
//

import Foundation

final class MainVm: ViewModel {
    // MARK: - Properties
    var bag = Bag()
    var taskBag = TaskBag()
    var output = AppSubject<Output>()

    // MARK: - Enums
    enum Input {
        case viewDidLoad
        case navigateToSecondVc
    }

    enum Output {
        case loader(isLoading: Bool)
        case showError(msg: String)
    }

    // MARK: - Functions
    func transform(input: AppAnyPublisher<Input>) -> AppAnyPublisher<Output> {
        input.weekSink(self) { strongSelf, event in
            switch event {
            case .viewDidLoad:
                strongSelf.signUp(with: "akashboghani111@gmail.com", for: "Test@123")
            case .navigateToSecondVc:
                let route = Route.second(name: "Hello Akash") { event in
                    switch event {
                    case let .sendName(name):
                        print(name)
                    }
                }
                strongSelf.router.push(to: route, with: .fade, for: 0.3)
            }
        }.store(in: &bag)
        return output.eraseToAnyPublisher()
    }

    private func signUp(with email: String, for password: String) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let user = try await firebaseServices.createUser(email: email, password: password)
                let userModel = try await firebaseServices.create(user: user)
                let userResult: UserModel = try await firebaseServices.getUser(by: userModel.id)
                print(userResult)
                output.send(.loader(isLoading: false))
            } catch let error as FirebaseError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskBag)
    }
}
