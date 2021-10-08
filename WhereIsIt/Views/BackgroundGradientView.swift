//
//  BackgroundGradientView.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/8/21.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("Tech Gold"), Color("Tech Gold"), Color("Main Gradient 2")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}
