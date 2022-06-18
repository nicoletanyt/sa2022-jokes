//
//  FeedbackResponseView.swift
//  jokes
//
//  Created by NICOLE TAN YITONG stu on 11/6/22.
//

import SwiftUI

struct FeedbackResponseView: View {
    
    var isPositive: Bool
    
    var body: some View {
        VStack{
            Image(isPositive ? "happy" : "sad")
                .resizable()
                .scaledToFit()
            Text(isPositive ? "slay have a cookie🍪": "cat is sad :(")
                .padding()
        }
    }
}

struct FeedbackResponseView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackResponseView(isPositive: true)
        FeedbackResponseView(isPositive: false)
    }
}
