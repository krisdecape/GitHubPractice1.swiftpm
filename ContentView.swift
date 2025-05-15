import SwiftUI

struct ContentView: View {
    @State var selectedCategory = "Inspiration"
    @State var currentQuote = "Select a category and tap the button!"
    
    let categories = ["Inspiration", "Encouragement", "Self-Made", "Hard-Work"]
    
    let quotesByCategory: [String: [String]] = [
        "Inspiration": [
            ""
        ],
        "Encouragement": [
            ""
        ],
        "Self-Made": [
            ""
        ],
        "Hard-Work": [
            ""
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
