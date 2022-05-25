//
//  AddDetailView.swift
//  lab09
//
//  Created by jerry on 2022/5/25.
//

import SwiftUI

struct AddDetailView: View {
    @EnvironmentObject var records: Records
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var record = Record()
    var body: some View {
        ZStack{
            Color(red: 230/255, green: 230/255, blue: 230/255)
            VStack{
                HStack{
                    Text("名稱")
                    TextField("名稱", text: $record.name)
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                }.padding([.top, .leading, .trailing])
                HStack{
                    Text("價格")
                    TextField("名稱", value: $record.price, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                }.padding(.horizontal)
                HStack{
                    Text("備註")
                    TextField("備註", text: $record.comment)
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                }.padding([.leading, .bottom, .trailing])
                Button{
                    records.records.append(record)
                    self.mode.wrappedValue.dismiss()
                }label: {
                    Text("新增")
                        .foregroundColor(.white)
                }
                .padding(.vertical,7.0)
                .frame(width: 350)
                .background(.blue)
                .buttonStyle(.bordered)
                .cornerRadius(10)
                Spacer()
            }
        }
        
    }
}

struct AddDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailView()
    }
}
