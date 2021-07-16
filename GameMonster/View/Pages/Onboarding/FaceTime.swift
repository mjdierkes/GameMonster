//
//  FaceTime.swift
//  GameMonster
//
//  Created by Mason Dierkes on 7/16/21.
//

import SwiftUI

struct FaceTime: View {
    
    @Binding var showModal: Bool

    @State private var facetimeID = ""
    @State private var isCorrectInput = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("FaceTime")
                .fontWeight(.heavy).font(.largeTitle).multilineTextAlignment(.center)
               .padding(.top, 70)
            
            Text("Add how you can be reached by FaceTime, to allow other friends to call you in the app.")
                .frame(height: 75)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .offset(y: -26)
            Spacer()

            HStack{
                Image(systemName: "video.fill")
                    .foregroundColor(Color.white)
                    .padding(.leading)
                Text("Play with Mason")
                    .foregroundColor(Color.white)
                ZStack{
                    Image(systemName: "person.fill")
                        .padding()
                        .frame(width: 50, height: 35)
                        .background(Color("Offwhite"))
                        .cornerRadius(17)

                }.scaleEffect(0.8)

            }
            .background(Color("FTGreen"))
            .cornerRadius(20)
            .onTapGesture {
                if let facetimeURL:NSURL = NSURL(string: "facetime://\(4694861731)") {
                    let application:UIApplication = UIApplication.shared
                    if (application.canOpenURL(facetimeURL as URL)) {
                        application.open(facetimeURL as URL);
                    }
                  }
            }


            TextField("Phone Number or Email", text: $facetimeID)
                .multilineTextAlignment(.center)
                .textContentType(.telephoneNumber)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    // Verify input is in a correct format
                    if facetimeID != ""{
                        isCorrectInput = true
                    }
                    else{
                        isCorrectInput = false
                    }
                }

            Button {UIApplication.shared.open(URL(string: "App-prefs:FACETIME")!)} label: {
                Text("Not Sure?")
            }

            Spacer()

            Text("We don't share or store this information in anyway. This is to make it easier for friends to reach you.")
                .font(.footnote)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding()

            Button {
                self.showModal.toggle()
            } label: {
                Text("Continue")
                    .bold()
                    .frame(maxWidth: 300)
                    .padding(10)
                    .foregroundColor(.white)
            }.background(isCorrectInput ? .blue : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .disabled(isCorrectInput == false)
            
            
            Button {self.showModal.toggle()} label: {
                Text("Setup Later")
            }
            .padding(.top)
            .padding(.bottom, 50)

        }
        .ignoresSafeArea(.keyboard)
        .padding()
        .transition(.move(edge: .leading))

    }
}

struct FaceTime_Previews: PreviewProvider {
    @State private static var showModal = false
    static var previews: some View {
        FaceTime(showModal: $showModal)
    }
}
