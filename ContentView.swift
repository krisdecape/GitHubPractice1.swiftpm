import SwiftUI

struct ContentView: View {
    @State var selectedCategory = "Inspiration"
    @State var currentQuote = "Select a category and tap the button!"
    
    let categories = ["Inspiration", "Encouragement", "Self-Made", "Hard-Work"]
    
    let quotesByCategory: [String: [String]] = [
        "Inspiration": [
            "Turn your wounds into wisdom. — Oprah Winfrey",
            "The future belongs to those who believe in the beauty of their dreams. — Eleanor Roosevelt"
        ],
        "Encouragement": [
            "Success is not final, failure is not fatal: it is the courage to continue that counts. — Winston Churchill",
            "It’s not who I am underneath, but what I do that defines me. — Bruce Wayne"
        ],
        "Self-Made": [
            "When one door closes, another one opens. - Kris Decape",
            "All problems are temporary, don't let your problems take over you permanently - Kris Decape"
        ],
        "Hard-Work": [
            "There is no substitute for hard work. — Thomas Edison",
            "It’s not about the medals; it’s about the hard work and sacrifice you put into it. — Simone Biles"
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
