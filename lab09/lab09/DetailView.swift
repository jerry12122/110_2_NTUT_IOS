//
//  DetailView.swift
//  lab09
//
//  Created by jerry on 2022/5/25.
//

import SwiftUI

struct DetailView: View {
    let record: Record
    var body: some View {
        ZStack{
            Color(red: 230/255, green: 230/255, blue: 230/255)
            VStack{
                Text("\(record.name)")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                List{
                    HStack{
                        Text("價格")
                        Spacer()
                        Text("\(record.price)")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        Text("備註")
                        Spacer()
                        Text("\(record.comment)")
                            .foregroundColor(.gray)
                    }
                }
                .cornerRadius(15)
                .scaledToFit()
                .padding(.horizontal)
                    
                    
                Spacer()
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(record:Record(name: "1", price: 100, comment: "1"))
            
    }
}
