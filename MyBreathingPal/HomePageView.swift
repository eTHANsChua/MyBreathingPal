import SwiftUI

struct HomePageView: View {
    var body: some View {
        VStack {
            // Top icons (profile and help)
            HStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                Spacer()
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                    .overlay(
                        Text("?")
                            .foregroundColor(.black)
                            .font(.headline)
                    )
            }
            .padding()
            
            // Recommended Section
            VStack(alignment: .leading) {
                Text("Recommended")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                GridView()
            }
            
            // Recently Played Section
            VStack(alignment: .leading) {
                Text("Recently Played")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                GridView()
            }
            
            Spacer()
            
            // Bottom Navigation Bar
            HStack {
                Image(systemName: "house.fill")
                    .font(.largeTitle)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .font(.largeTitle)
                Spacer()
                Image(systemName: "book.fill")
                    .font(.largeTitle)
            }
            .padding()
        }
    }
}

// placeholder for grid items
struct GridView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0..<6) { _ in
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 80)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
