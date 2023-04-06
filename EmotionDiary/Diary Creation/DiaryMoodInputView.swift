
import SwiftUI

struct DiaryMoodInputView: View {
    
    @ObservedObject var vm : DiaryViewModel
    
    let moods: [Mood] = Mood.allCases
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach(moods, id: \.self) { mood in
                    Button {
                        print("Mood Selected")
                        vm.mood = mood
                    } label: {
                        
                        VStack {
                            Image(systemName: mood.imageName)
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 80)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                                .padding()
                            Text(mood.name)
                                .foregroundColor(.gray)
                        }
                        .frame(height: 180)
                        .background(mood == vm.mood ? .gray.opacity(0.4) : .clear)
                        .cornerRadius(10)
                    }
                }
            }
            Spacer()
            
            NavigationLink {
                DiaryTextInputView()
            } label: {
                Text("Next")
                    .frame(width: 200, height: 80)
                    .foregroundColor(.white)
                    .background(.pink)
                    .cornerRadius(40)
            }
        }
    }
}

struct DiaryMoodInputView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryMoodInputView(vm: DiaryViewModel(isPresented: .constant(false)))
    }
}
