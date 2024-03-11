//
//  SecondVm.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 10/03/24.
//

import Foundation

// MARK: - SecondVcEvent
enum SecondVcEvent {
    case sendName(name: String)
}

// MARK: - SecondVm
final class SecondVm: ViewModel {
    // MARK: - Properties
    private var disposeBag = Bag()
    private var output = AppSubject<Output>()
    var eventHandler: EventHandler<SecondVcEvent>
    var name: String

    // MARK: - Life-Cycle
    init(name: String, eventHandler: @escaping EventHandler<SecondVcEvent>) {
        self.name = name
        self.eventHandler = eventHandler
    }

    // MARK: - Enums
    enum Input {
        case popBack
    }

    enum Output {
        case loader(isLoading: Bool)
        case showError(msg: String)
    }

    // MARK: - Functions
    func transform(input: AppAnyPublisher<Input>) -> AppAnyPublisher<Output> {
        input.weekSink(self) { strongSelf, event in
            switch event {
            case .popBack:
                strongSelf.eventHandler(.sendName(name: strongSelf.name))
                strongSelf.router.pop(with: .fade, for: 0.3)
            }
        }.store(in: &disposeBag)
        return output.eraseToAnyPublisher()
    }
}
