import SwiftUI

struct ContentView: View {
    @State var selectedCategory = "Inspiration"
    @State var currentQuote = "Select a category and tap the button!"
    
    let categories = ["Inspiration", "Encouragement", "Dedicated", "Hard-Work"]
    
    
    let quotesByCategory: [String: [String]] = [
        "Inspiration": [
            ""
        ],
        "Encouragement": [
            ""
        ],
        "Dedicated": [
            ""
        ],
        "Hard-Work": [
            ""
        ]
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            Text("💬 Quotes4You 💬")
                .font(.custom("Papyrus", size: 40))
            
            Picker("Select Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            Text(currentQuote)
                .font(.title3)
                .padding()
                .multilineTextAlignment(.center)
            
            Button(action: generateQuote) {
                Text("Generate Quote")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
    
    func generateQuote() {
        let quotes = quotesByCategory[selectedCategory] ?? []
        currentQuote = quotes.randomElement() ?? "No quote available."
    }
}
