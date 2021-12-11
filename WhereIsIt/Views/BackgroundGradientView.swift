//
//  BackgroundGradientView.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/8/21.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("Navy Blue"), Color("Main Gradient 2"), Color("Navy Blue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}
