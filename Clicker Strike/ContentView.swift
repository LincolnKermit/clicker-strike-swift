import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    @State private var isClicked = false
    @State public var score = 0
    
    let seconds = 0.2
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.top, 40)
            
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
                    score += 1
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
