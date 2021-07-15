//
//  OnboardingView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 7/14/21.
//

// To be presented when a user finishes playing their very first game.


import SwiftUI

struct OnboardingView: View {
    
    @Binding var showModal: Bool
    
    @State private var facetimeID = ""
    @State private var isCorrectInput = false
    @State private var pageID = 0
    
    var body: some View {
       
        ZStack {
            if pageID == 0 {
                VStack{

                    Text("Welcome to\nGame Monster")
                        .fontWeight(.heavy).font(.largeTitle).multilineTextAlignment(.center)
                        .padding(.top, 70)


                    FeatureSection(title: "Add almost anything", description: "Capture documents, photos maps, and more for a richer notes experience.", systemImage: "video.circle.fill")

                    FeatureSection(title: "Note to self, or with anyone", description: "Invite others to view or make changes to a note.", systemImage: "person.crop.circle.fill")

                    FeatureSection(title: "Sketch your thoughts", description: "Draw using just your finger.", systemImage: "hand.draw.fill")

                    Spacer()

                    Button {
                        withAnimation {
                            pageID = 1
                        }
                    } label: {
                        Text("Continue")
                            .bold()
                            .frame(maxWidth: 300)
                            .padding(10)
                            .foregroundColor(.white)
                    }.background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .padding(.bottom, 50)

                }
                .transition(.slide)
            }
            else if pageID == 1 {
                VStack(alignment: .center){
            
                        
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

       
        
        
        

        

        
        
    }
}


struct FeatureSection: View {
    
    public let title: String
    public let description: String
    public let systemImage: String
    
    var body: some View {
        HStack{
            Image(systemName: systemImage)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.green)
                .padding(.trailing)
            
            VStack(alignment: .leading){
                Text(title)
                    .bold()
                Text(description)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
        .padding(20)
        .frame(width: 350)


    }
    
}

struct OnBoardingView_Previews: PreviewProvider {
    @State static private var showModal = false
    static var previews: some View {
        OnboardingView(showModal: $showModal)
    }
}
