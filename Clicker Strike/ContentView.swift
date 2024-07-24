import SwiftUI

struct ContentView: View {
    @State private var isClicked = false
    @State private var score = 0
    @State private var jetons = 1
    let seconds = 0.2
    
    var body: some View {
        VStack {
            Text("Hey, Let's click")
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 40)
            
            Text("\(score)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.top, 20)
            
            Spacer()
            
            Text("👆🏻")
                .font(.system(size: isClicked ? 200 : 100))
                .animation(
                    Animation.easeInOut(duration: 0.2),
                    value: isClicked
                )
                .onTapGesture {
                    isClicked.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        isClicked.toggle()
                    }
                    score += jetons
                    jetons = score // score = 1^^x ( where x reprensent the click )
                }
            
            Spacer()
            
            if score > 2^10 {
                VStack {
                    Text("Awesome!!! 🎉")
                        .font(.title)
                        .foregroundColor(.yellow)
                    Text("X10")
                        .font(.title)
                        .foregroundColor(.red)
                    Text("🎉🎉🎉")
                        .font(.title)
                        .bold()
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
