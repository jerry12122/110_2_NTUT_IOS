//
//  ContentView.swift
//  lab8
//
//  Created by jerry on 2022/5/18.
//

import SwiftUI

struct ContentView: View {
    @State private var isSwitchOn = false
    @State private var age = 0
    @State private var birthday = Date()
    @State private var slider: Double = 0
    let roles = ["mojito", "稻香", "夜曲", "告白氣球"]
    @State private var selectedIndex = 0
    @State private var message :String = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white,.yellow], startPoint: .top, endPoint: .bottom)
            VStack{
                Text("周杰倫")
                    .font(.title)
                
                Image("周杰倫")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
                Toggle("是粉絲嗎?",isOn: $isSwitchOn)
                    .padding(.horizontal)
                
                Stepper(value: $age, in: 0...100,step: 1) {
                    Text("年齡    ：\(age)")
                }
                .padding(.horizontal)
                
                DatePicker(selection: $birthday, displayedComponents: .date, label: { Text("生日：") })
                    .padding(.horizontal)
                
                HStack{
                    Text("喜歡程度： \(Int(slider))分")
                    Slider(value: $slider, in: 0...10,step: 1)
                }
                .padding(.horizontal)
                HStack{
                    Text("喜歡的歌：")
                    Spacer()
                    Picker(selection: $selectedIndex,  label: Text("")){
                        ForEach(0..<roles.count){ index in
                            Text(self.roles[index]).tag(index)
                        }
                    }
                    .frame(width: 250.0)
                    .pickerStyle(.wheel)
                    
                }.padding(.horizontal)
                
                            
                TextField("說點什麼", text: $message)
                    .padding()
                    .frame(width: 370.0)
                    .background(.white)
                    .cornerRadius(20)
                
                Button {
                    showAlert = true
                    alertTitle = isSwitchOn ?  "我是粉絲" : "我不是粉絲"
                } label: {
                    Text("送出")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .background(LinearGradient(colors: [.orange,.yellow], startPoint: .leading, endPoint: .trailing))
                .buttonStyle(.bordered)
                .cornerRadius(15)
                .alert(alertTitle, isPresented: $showAlert, actions: {
                    Button("OK") { }
                }, message: {
                    Text("他今年\(age)歲\n\n他的生日是\(birthday.formatted(date: .numeric,time:.omitted ))\n\n我\(Int(slider))分喜歡他\n\n我喜歡的歌是\(roles[selectedIndex])\n\n我想對他說:\(message)")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
