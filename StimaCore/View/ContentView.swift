//
//  ContentView.swift
//  StimaCore
//
//  Created by salvatore dessena on 19/02/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State var title: String = ""
    @State var comune: String = ""
    @State var nome: String = ""
   
    @State private var showNewTaskItem: Bool = false
    @State private var searchText = ""
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // MARK: - FUNCTION
    // DELETE
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    

    //MARK: - BODY
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // MARK: - MAIN VIEW
                VStack {
                    
                    
                    // MARK: - NEW TASK BUTTON
                    Button(action: {
                        showNewTaskItem = true
                        playSound(sound: "sound-tap", type: "mp3")
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .light))
                        
                    })
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(Color("ColorPinkBright"))
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 8, x: 0, y: 4.0)
                    
                        .padding(.bottom, 10)
                    
                    // MARK: - LIST OF ITEMS
                    List {
                        ForEach(items) { item in
                            VStack {
                                NavigationLink(destination: DetailView(item: item)) {
                                    ListRowItemView(item: item)
                                }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    } //: END OF LIST OF ITEMS
                    
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.08), radius: 14)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                } //: VSTACK
                
                // MARK: - NEW TASK ITEM
                if showNewTaskItem {
                    BlankView()
                        .onTapGesture {
                            withAnimation() {
                                showNewTaskItem = false
                            }
                        }
                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
            } //: ZSTACK
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarItems(trailing:  HStack {
                EditButton()
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.horizontal, 20)
                    .frame(minWidth: 64, minHeight: 24)
                    .background(
                        Capsule().stroke(Color("ColorPinkBright"), lineWidth: 2.0)
                )
                // APPEARANCE BUTTON
                Button(action: {
                    //TOGGLE Appearance
                    isDarkMode.toggle()
                }, label: {
                    Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .font(.system(.title))
                })
            })
            .navigationBarTitle("StimaCore")
           
        } //: NAVIGATION
        .accentColor(Color("ColorPinkBright"))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
