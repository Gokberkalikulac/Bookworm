//
//  AddBookView.swift
//  Bookworm
//
//  Created by Gökberk Ali Kulaç on 10.02.2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title : String = ""
    @State private var author : String = ""
    @State private var rating : Int = 3
    @State private var genre : String = ""
    @State private var review : String = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller","Anime"]
    
    var body: some View {
        NavigationStack{
            VStack {
                Form{
                    Section("About Book"){
                        TextField("Name of the book", text: $title)
                        TextField("Name of the author", text: $author)
                        
                    }
                    Section("Category"){
                        Picker("Genre", selection: $genre) {
                            ForEach(genres,id: \.self){
                                Text($0)
                            }
                        }
                    }
                    
                    Section("Review"){
                        TextEditor(text: $review)
                    }
                    
                    Section("Rating"){
                        RatingView(rating: $rating)
                    }
                    
                }
                 
                Button("Save"){
                    let newBook = Book(context: managedObjectContext)
                    newBook.id = UUID()
                    newBook.title = title
                    newBook.author = author
                    newBook.rating = Int16(rating)
                    newBook.genre = genre
                    newBook.review = review
                    
                    try? managedObjectContext.save()
                    dismiss()
                    
                }
                
                .navigationTitle("Add Book")
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

