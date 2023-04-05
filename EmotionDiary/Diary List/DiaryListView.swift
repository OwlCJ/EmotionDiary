
import SwiftUI

struct DiaryListView: View {
    
    @StateObject var vm: DiaryListViewModel
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        NavigationView {
            VStack{
                ScrollView {
                    LazyVGrid(columns: layout) {
                        ForEach(vm.keys, id: \.self) { key in
                            Section {
                                let items = vm.dic[key] ?? []
                                let orderedItems = items.sorted(by: { $0.date < $1.date})
                                ForEach(orderedItems) { item in
                                    MoodDiaryCell(diary: item)
                                        .frame(height: 50)
                                }
                            } header: {
                                Text(formattedSectionTitle(key))
                                    .font(.system(size: 30, weight: .black))
                            }
                            .frame(height: 60)
                            .padding()
                        }
                    }
                }
                
                HStack {
                    Button {
                        print("New Button Tapped")
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .background(.pink)
                    .cornerRadius(40)
                }
            }
            .navigationTitle("Emotion Diary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel())
    }
}

extension DiaryListView {
    private func formattedSectionTitle(_ id: String) -> String {
        let dateComponents = id
            .components(separatedBy: "-")
            .compactMap{ Int($0) }
        guard let year = dateComponents.first, let month = dateComponents.last else {
            return id
        }
        
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month)
        let date = dateComponent.date!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}
