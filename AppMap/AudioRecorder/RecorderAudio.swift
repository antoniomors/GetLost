//
//  ContentView.swift
//  Recordino
//
//  Created by Aida Hyseni on 21/05/22.
//

import SwiftUI

struct RecorderAudio: View {
    
    @ObservedObject var audioRecorder : AudioRecorder
    var body: some View {
        VStack{

RecordingsList(audioRecorder: AudioRecorder())

            if audioRecorder.recording == false{
                Button(action: {self.audioRecorder.startRecording()}){
                        Circle()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .foregroundColor(Color.red)
                        .padding(.bottom, 40)

            
                    
                }}
            else{
                Button(action: {self.audioRecorder.stopRecording()}){
                    Circle()
                        .stroke(Color.black, lineWidth: 6)
                        .clipped()
                        .frame(width: 115, height: 115)
                        .padding(.bottom, 40)
                }
            }
        }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecorderAudio(audioRecorder: AudioRecorder())
    }
}
}
