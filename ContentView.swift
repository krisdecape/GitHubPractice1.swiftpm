import SwiftUI

struct ContentView: View {
    @State var selectedCategory = "Inspiration"
    @State var currentQuote = "Select a category and tap the button!"
    
    let categories = ["Inspiration", "Encouragement", "Self-Made", "Hard-Work"]
    
    let quotesByCategory: [String: [String]] = [
        "Inspiration": [
            "Turn your wounds into wisdom. — Oprah Winfrey",
            "The future belongs to those who believe in the beauty of their dreams. — Eleanor Roosevelt",
            "Even if I knew that tomorrow the world would go to pieces, I would still plant my apple tree. - Martin King Luther",
            "Let us dream of tomorrow where we can truly love from the soul, and know love as the ultimate truth at the heart of all creation. - Micheal Jackson",
            "It is never too late to be what you might have been. - George Eliot", 
            "Be the change that you wish to see in the world. - Mahatma Gandhi"
        ],
        "Encouragement": [
            "Success is not final, failure is not fatal: it is the courage to continue that counts. — Winston Churchill",
            "It’s not who I am underneath, but what I do that defines me. — Bruce Wayne",
            "When something is important enough, you do it even if the odds are not in your favor. - Elon Musk",
            "Setting goals is the first step in turning the invisible into the visible. - Tony Robbin", 
            "Success is not final, failure is not fatal: It is the courage to continue that counts. ―Winston Churchill",
            "Don’t be afraid to give up the good to go for the great. ―John D. Rockefeller"
        ],
        "Self-Made": [
            "When one door closes, another one opens. - Kris Decape",
            "All problems are temporary, don't let your problems take over you permanently - Kris Decape",
            "When you fall, get up, keep your chin up, and keep walking. - Tsogtuguldur Erdenebulgan",
            "Never judge someone who follows their heart over their mind. - Tsogtuguldur Erdenebulgan", "Nobody knows you as much as the friend you grew up with. - Ryosuke Nakamura",
            "You miss 100% of the shots you don't take - Ryosuke Nakamura"
        ],
        "Hard-Work": [
            "There is no substitute for hard work. — Thomas Edison",
            "It’s not about the medals; it’s about the hard work and sacrifice you put into it. — Simone Biles",
            "A dream doesn't become reality through magic; it takes sweat, determination and hard work. - Collin Powell",
            "Success isn't always about greatness. It's about consistency. Consistent hard work leads to success. Greatness will come. - Dwayne Jonhson", 
            "I find that the harder I work, the more luck I seem to have - Thomas Jefferson.",
            "Hard work beats talent when talent doesn't work hard - Tim Notke, Basketball Coach."
        ]
    ]
    
    var body: some View {
        ZStack {
           
            LinearGradient(
                gradient: Gradient(colors: [.purple, .blue, .mint]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("💬 Quotes4You 💬")
                    .font(.custom("Papyrus", size: 40))
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                
                Picker("Select Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                

                Text(currentQuote)
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.85))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button(action: generateQuote) {
                    Text("Generate Quote")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
    
    func generateQuote() {
        let quotes = quotesByCategory[selectedCategory] ?? []
        currentQuote = quotes.randomElement() ?? "No quote available."
    }
}
