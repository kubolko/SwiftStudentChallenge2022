import SwiftUI

struct JavaScriptInterviewTips: View {

    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var viewModel: ViewModel
    let language: LanguageElement

    var body: some View {

        ZStack() {
            LinearGradient(gradient: Gradient(colors: viewModel.stringToColor(color: language.colors)), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            BackgroundSender(images: language.images)
                .edgesIgnoringSafeArea(.all)
            VStack() {
                ZStack() {
                    // MARK: Back Button
                    HStack() {

                        Button {
                            withAnimation {
                                viewRouter.currentPage = .javaScriptMenu
                            }
                        } label: {
                            HStack() {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.black)
                                Text("Go back")
                                    .foregroundColor(.black)
                            }
                        }.buttonStyle(PlainButtonStyle())
                            .padding()
                        Spacer()
                    }
                    HStack() {
                        Image(language.name)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.screenWidth/4)

                    }
                }

                Text("Tips for getting the dream job!")
                    .padding()
                    .foregroundColor(Color(hex: language.fontColor))
                    .font(Font.custom(language.font, size: 34))

                ScrollView(.vertical) {
                    Text("Before you send your Resume")
                    ForEach(viewModel.javaScriptInterviewTips.beforeYouSendCV) { i in
                            VStack() {
                                Text("")
                                    Text(i.text)
                                        .frame(width: UIScreen.screenWidth/2)

                                      Text("")
                            }                                    .background(
                                Rectangle()
                                    .fill(.white)
                                    .cornerRadius(20)
                            )
                            .padding(10)
                        }
                    Text("What to do before the interview?")
                        ForEach(viewModel.javaScriptInterviewTips.beforeRecruitingTask) { i in
                            VStack() {
                                Text("")
                                    Text(i.text)
                                        .frame(width: UIScreen.screenWidth/2)

                                      Text("")
                            }                                    .background(
                                Rectangle()
                                    .fill(.white)
                                    .cornerRadius(20)
                            )
                            .padding(10)
                        }

                    Text("Practical tips before your first day 👉")
                        ForEach(viewModel.javaScriptInterviewTips.beforeYourFirstDay) { i in
                            VStack() {
                                Text("")
                                    Text(i.text)
                                        .frame(width: UIScreen.screenWidth/2)

                                      Text("")
                            }                                    .background(
                                Rectangle()
                                    .fill(.white)
                                    .cornerRadius(20)
                            )
                            .padding(10)
                        }

                }
            }
        }.onAppear(perform: {viewModel.getInterviewTips(interviewTipsFileName: "JavaScriptInterviewTips", language: "JavaScript")})
    }
}
