//
//  Extention+Publishers.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 17/02/24.
//

import Combine

extension Publisher where Failure == Never {
    func weekAssign<Object: AnyObject>(
        to keyPath: ReferenceWritableKeyPath<Object, Output>,
        on object: Object
    ) -> AnyCancellable {
        sink { [weak object] value in
            object?[keyPath: keyPath] = value
        }
    }

    func weekSink<Object: AnyObject>(
        _ object: Object,
        receiveValue: @escaping (_ strongSelf: Object, _ event: Self.Output) -> Void
    ) -> AnyCancellable {
        sink { [weak object] output in
            guard let strongRef = object else {
                return
            }
            receiveValue(strongRef, output)
        }
    }
}
