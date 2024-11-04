import SwiftUI

struct SearchPageView: View {
    var body: some View {
        VStack {
            // Top Circle and Search Text
            HStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                Spacer()
                Text("Search")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            // Filters Section
            VStack(alignment: .leading, spacing: 20) {
                Text("Filters")
                    .font(.title2)
                    .fontWeight(.bold)
                
                // Breathing Techniques
                VStack(alignment: .leading) {
                    Text("Breathing Techniques")
                        .font(.headline)
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 40)
                            .foregroundColor(.gray)
                            .overlay(Text("Pursed Lip"))
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 120, height: 40)
                            .foregroundColor(.gray)
                            .overlay(Text("Diaphragmatic"))
                    }
                }
                
                // Song Genre
                VStack(alignment: .leading) {
                    Text("Song Genre")
                        .font(.headline)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(0..<6) { _ in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 40)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                // Breathing Score
                VStack(alignment: .leading) {
                    Text("Breathing Score")
                        .font(.headline)
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 40)
                            .foregroundColor(.gray)
                            .overlay(Text(">75"))
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 40)
                            .foregroundColor(.gray)
                            .overlay(Text(">50"))
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 40)
                            .foregroundColor(.gray)
                            .overlay(Text(">25"))
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Bottom Search Icon and Go Button
            VStack {
                Image(systemName: "magnifyingglass")
                    .font(.largeTitle)
                Text("GO")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.bottom)
        }
        .padding()
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
