//
//  ContentView.swift
//  DiceRoll
//
//  Created by Fouad Mohammed Rafique Anwar on 21/06/24.
//

import SwiftUI

struct DiceRollView: View {
    
    @ObservedObject var viewModel: DiceRollViewModel = DiceRollViewModel()

    var body: some View {
        
        VStack() {
            Text("Dice Roll")
                .font(.title)
                .bold()
                .padding()
            Spacer()
            HStack() {
                ForEach(viewModel.dices, id: \.self) { dice in
                    Image(systemName: "die.face.\(dice)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.red)
                        .frame(width: 100, height: 100)
                }
            }
            Button(action: {
                viewModel.rollDice()
            }) {
                Text("Roll")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
            VStack {
                Text("Dice count: \(viewModel.numberOfDices)")
                    .font(.title2)
                    .bold()
                Picker("Dice count", selection: $viewModel.numberOfDices) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    DiceRollView()
}
