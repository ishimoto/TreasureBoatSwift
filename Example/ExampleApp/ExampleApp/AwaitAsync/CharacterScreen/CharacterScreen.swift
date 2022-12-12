//
//  CharacterScreen.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/06/26.
//

import SwiftUI

struct CharacterScreen: View {
    
    @StateObject private var vm = CharacterScreenVM(
        service: CharacterService()
    )
    
    var body: some View {
        NavigationView {
            
            switch vm.state {
                
            case .loading:
                ProgressView()
                
            case .success(let data):
                List {
                    ForEach(data, id: \.id) { item in
                        Text(item.name)
                    }
                }
                .navigationBarTitle("Characters")
                    
            default:
                EmptyView()
            }
            
        }
        .task {
            await vm.getCharacters()
        }
        .alert("Error", isPresented: $vm.hasError, presenting: vm.state) { detail in
            Button {
                Task {
                    await vm.getCharacters()
                }
            } label: {
                Text("Retry")
            }
        } message: { detail in
            if case let .failed(error) = detail {
                Text(error.localizedDescription)
            }
        }
    }
}

struct CharacterScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterScreen()
    }
}
