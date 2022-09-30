//
//  HomeView.swift
//  Restart
//
//  Created by Donizetti de Souza on 9/28/22.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: HEADER
                
                Spacer()
                
                VStack(spacing: 0){
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity) //transicao com opacidade
                        .id(textTitle) //cria um identificador pro texto
                    
                    Text("""
                    It`s not how much we give but how much love we put into giving.
                    """
                    )
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating) //animacao do texto superior
                
                // MARK: CENTER
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1) //movimento
                        .blur(radius: abs(imageOffset.width / 5 ))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0) //configura opacidade se variavel animad amarcad
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2 , y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20 )))
                        .gesture(DragGesture()
                            .onChanged { gesture in
                                imageOffset = gesture.translation
                                if abs(imageOffset.width) <= 150 {
                                    imageOffset = gesture.translation
                                    withAnimation(.linear(duration: 0.25)){ // quando movimento some o indicador de opacidade
                                        indicatorOpacity = 0
                                        textTitle = "Give."
                                    }
                                }
                            }
                            .onEnded({ _ in
                                imageOffset = .zero
                                
                                withAnimation(.linear(duration: 0.25)){
                                    indicatorOpacity = 1
                                    textTitle = "Share."
                                }
                            })
                    ) //: GESTURE
                        .animation(.easeOut(duration: 1), value: imageOffset) // retorna a posicao originzal
                } //CENTER  imagem centro
                
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20) //move para baixo
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                    , alignment: .bottom
                )
                
                Spacer()
                
                // MARK: FOOTER
                
                ZStack{ //cria o botao abaixo
                    
                    //PARTS OF THE CUTOM BUTTON
                    
                    // 1 .BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2 .CALL TO ACTION (STATIC)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3 .CAPSULE (DYNAMIC WIDTH)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                            .opacity(0.2)
                        
                        Spacer()
                    }
                    
                    // 4 . CIRCLE (DRAGGABLE)
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset) // movimenta a bola vermelha
                        .gesture( //movimentos na bola
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded { _ in  //animacao que acontece no fim do de puxar a bolinha, quando solta a tela
                                    withAnimation(Animation.easeOut(duration: 0.4)){ //animacao mudanca de tela
                                        if buttonOffset > buttonWidth / 2 {
                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = true
                                        } else {
                                            hapticFeedback.notificationOccurred(.warning)
                                            buttonOffset = 0
                                        }
                                    }
                                }
                            //: GESTURE
                        )
                        Spacer()
                    } //:HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding() //evita bordas da tela
                .opacity(isAnimating ? 1 : 0)
                .offset(y : isAnimating ? 0 :40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //: VSTACK
        } //: ZSTACK
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
