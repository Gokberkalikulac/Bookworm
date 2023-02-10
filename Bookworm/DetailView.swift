//
//  DetailView.swift
//  Bookworm
//
//  Created by Gökberk Ali Kulaç on 10.02.2023.
//

import SwiftUI

struct DetailView: View {
    let book : Book
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .backgroundStyle(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5 , y: -5)
            }
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "Unknown Review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete this book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Are you sure? ")
        }
        .toolbar {
            Button{
                showingDeleteAlert = true
            }label: {
                Label("Delete this book", systemImage: "trash")
            }
        }

    }
    
    func deleteBook(){
        managedObjectContext.delete(book)
        try? managedObjectContext.save()
        dismiss()
    
    }
    
}

