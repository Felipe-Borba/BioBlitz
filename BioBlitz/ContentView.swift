//
//  ContentView.swift
//  BioBlitz
//
//  Created by Felipe Silva de Borba on 04/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var board = GameBoard()
    
    var body: some View {
        VStack {
            HStack {
                Text("GREEN: \(board.greenScore)")
                    .padding()
                    .background(Capsule().fill(.green).opacity(board.currentPlayer == .green ? 1 : 0))
                
                Spacer()
                
                Text("BIOBLITZ")
                
                Spacer()
                
                Text("RED: \(board.redScore)")
                    .padding()
                    .background(Capsule().fill(.red).opacity(board.currentPlayer == .red ? 1 : 0))
            }
            .font(.system(size: 36).weight(.black))
            
            ZStack {
                VStack {
                    ForEach(0..<board.rowCount, id: \.self) { row in
                        HStack {
                            ForEach(0..<board.columnCount, id: \.self) { col in
                                let bacteria = board.grid[row][col]
                                
                                BacteriaView(bacteria: bacteria ) {
                                    board.rotate(bacteria: bacteria)
                                }
                            }
                        }
                    }
                }
                .clipped()
                
                if let winner = board.winner {
                    VStack {
                        Text("\(winner) wins!")
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                        
                        Button(action: board.reset) {
                            Text("Play Again")
                                .foregroundColor(Color.white)
                                .padding()
                                .background(.blue)
                                .clipShape(Capsule())
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(40)
                    .background(.black.opacity(0.85))
                    .cornerRadius(25)
                    .transition(.scale)
                }
            }
        }
        .padding()
        .fixedSize()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
