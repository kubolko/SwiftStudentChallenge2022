import SwiftUI

struct SwiftInterviewTips: View {

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
                                viewRouter.currentPage = .swiftMenu
                            }
                        } label: {
                            HStack() {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.white)
                                Text("Go back")
                                    .foregroundColor(.white)
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
                        .font(.title2)
                    ForEach(viewModel.swiftInterviewTips.beforeYouSendCV) { i in
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
                        .font(.title2)
                    ForEach(viewModel.swiftInterviewTips.beforeRecruitingTask) { i in
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
                        .font(.title2)
                    ForEach(viewModel.swiftInterviewTips.beforeYourFirstDay) { i in
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
        }.onAppear(perform: {viewModel.getInterviewTips(interviewTipsFileName: "SwiftInterviewTips", language: "Swift")})
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftInterviewTips(viewModel: ViewModel(), language: LanguageElement(name: "Swift", languageDescription: "Swift is easy to learn, modern, and veeery powerful. Right now it allows you to create an universal app, which will work from Apple Watch to Mac computer. Swift developers are really in need now, there are many iPhones and Macs needing their apps!", image: "Swift", colors: ["FBAF40", "FF3527"], font: "UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.regular)", fontColor: "FFFFFF", isSemicolon: false, images: ["Swift1", "Swift2", "Swift3"], index: 0, buttonColor: "FFFFFF"))
    }
}
