//
//  PreviewProvider.swift
//  
//
//  Created by Ken Ishimoto on 2023/06/11.
//

import SwiftUI

    // Given the above drawbacks with .variable in rendering views, I’m including some additional generic binding wrappers
    // for views requiring up to four different bindings.

    /*
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                Bindings2(true, "Mike") {
                    AnotherComplexView(value: $0, name: $1)
                }
            }
        }
    */

public struct TBBindings1<Value, Content:View>: View {
    @State var value: Value
    let content: (_ value: Binding<Value>) -> Content
    init(value: Value, @ViewBuilder content: @escaping (_ value: Binding<Value>) -> Content) {
        _value = .init(initialValue: value)
        self.content = content
    }
    public var body: some View {
        content($value)
    }
}

public struct TBBindings2<V0, V1, Content:View>: View {
    @State var v0: V0
    @State var v1: V1
    let content: (_ v0: Binding<V0>, _ v1: Binding<V1>) -> Content
    init(_ v0: V0, _ v1: V1, @ViewBuilder content: @escaping (_ v0: Binding<V0>, _ v1: Binding<V1>) -> Content) {
        _v0 = .init(initialValue: v0)
        _v1 = .init(initialValue: v1)
        self.content = content
    }
    public var body: some View {
        content($v0, $v1)
    }
}

public struct TBBindings3<V0, V1, V2, Content: View>: View {
    @State var v0: V0
    @State var v1: V1
    @State var v2: V2
    let content: (_ v0: Binding<V0>, _ v1: Binding<V1>, _ v2: Binding<V2>) -> Content
    init(_ v0: V0, _ v1: V1, _ v2: V2,
         @ViewBuilder content: @escaping (_ v0: Binding<V0>, _ v1: Binding<V1>, _ v2: Binding<V2>) -> Content) {
        _v0 = .init(initialValue: v0)
        _v1 = .init(initialValue: v1)
        _v2 = .init(initialValue: v2)
        self.content = content
    }
    public var body: some View {
        content($v0, $v1, $v2)
    }
}

public struct TBBindings4<V0, V1, V2, V3, Content: View>: View {
    @State var v0: V0
    @State var v1: V1
    @State var v2: V2
    @State var v3: V3
    let content: (_ v0: Binding<V0>, _ v1: Binding<V1>, _ v2: Binding<V2>, _ v3: Binding<V3>) -> Content
    init(_ v0: V0, _ v1: V1, _ v2: V2, _ v3: V3,
         @ViewBuilder content: @escaping (_ v0: Binding<V0>, _ v1: Binding<V1>, _ v2: Binding<V2>, _ v3: Binding<V3>) -> Content) {
        _v0 = .init(initialValue: v0)
        _v1 = .init(initialValue: v1)
        _v2 = .init(initialValue: v2)
        _v3 = .init(initialValue: v3)
        self.content = content
    }
    public var body: some View {
        content($v0, $v1, $v2, $v3)
    }
}

extension Binding {
    
    /// `.variable` can be used instead of `.constant` in PreviewProviders
    /// so toogle for example will change in the preview. (NO full screen updates)
    /// ``AmazinglyComplexView(value: .variable(true))``
    public static func variable(_ value: Value) -> Binding<Value> {
        var state = value
        return Binding<Value> {
            state
        } set: {
            state = $0
        }
    }
    
}
