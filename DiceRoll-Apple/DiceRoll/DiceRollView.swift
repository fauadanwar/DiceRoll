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
        VStack(spacing: 50.0) {
            Text("Dice Roll")
                .font(.title)
                .bold()
                .padding()
            HStack(spacing: 20.0) {
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
            Stepper("Dice count: \(viewModel.numberOfDices)", value: $viewModel.numberOfDices, in: 1...2)
        }
        .padding()
    }
}

#Preview {
    DiceRollView()
}
