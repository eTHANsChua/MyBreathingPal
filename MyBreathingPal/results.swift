import SwiftUI

struct ResultsPageView: View {
    @State private var currentPage = 1
    private let totalPages = 5 // Adjust the total number of pages as needed
    
    var body: some View {
        VStack {
            // Results Title
            Text("Results")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            // Results Grid
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(0..<30) { _ in // Adjust the number of items per page
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 40)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            
            // Pagination Controls
            HStack {
                Button(action: {
                    if currentPage > 1 {
                        currentPage -= 1
                    }
                }) {
                    Text("Previous")
                }
                .disabled(currentPage == 1)
                
                Spacer()
                
                Text("Page \(currentPage) of \(totalPages)")
                
                Spacer()
                
                Button(action: {
                    if currentPage < totalPages {
                        currentPage += 1
                    }
                }) {
                    Text("Next")
                }
                .disabled(currentPage == totalPages)
            }
            .padding()
        }
        .padding(.bottom)
    }
}

struct ResultsPageView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsPageView()
    }
}
