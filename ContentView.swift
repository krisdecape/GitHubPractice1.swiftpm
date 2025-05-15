import SwiftUI

struct ContentView: View {
    @State var selectedCategory = "Inspiration"
    @State var currentQuote = "Select a category and tap the button!"
    
    let categories = ["Inspiration", "Encouragement", "Dedication", "Hard-Work"]
    
    let quotesByCategory: [String: [String]] = [
        "Inspiration": [
            "The best way to get started is to quit talking and begin doing.",
            "Dream big and dare to fail."
        ],
        "Encouragement": [
            "Keep going, everything you need will come to you at the perfect time.",
            "You are capable of amazing things."
        ],
        "Dedication": [
            "Success doesn’t come from what you do occasionally, it comes from what you do consistently.",
            "Stay dedicated, it's not going to happen overnight."
        ],
        "Hard-Work": [
            "There are no shortcuts to any place worth going.",
            "Work hard in silence, let success make the noise."
        ]
    ]
    
    var body: some View {
        ZStack {
            // Background gradient
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
                
                // Quote box
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
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.85))
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
