//
//  TTSMainViewController.h
//  TTSDemo
//
//  Created by Brandon Phillips on 9/30/13.
//  Copyright (c) 2013 Fresh Squeezed Pixels LLC. All rights reserved.
//

@import AVFoundation;

@interface TTSMainViewController : UIViewController <AVSpeechSynthesizerDelegate, UITextFieldDelegate>

//UI
@property (strong, nonatomic) IBOutlet UITextField *textInput;

@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@property (strong, nonatomic) IBOutlet UIButton *talkButton;

-(IBAction)talk:(id)sender;

//Sound
@property (strong, nonatomic) AVAudioSession *session;

@property (strong, nonatomic) AVSpeechSynthesizer *synth;

@property (strong, nonatomic) AVSpeechSynthesisVoice *voice;

@end
