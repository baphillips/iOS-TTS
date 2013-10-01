//
//  TTSMainViewController.m
//  TTSDemo
//
//  Created by Brandon Phillips on 9/30/13.
//  Copyright (c) 2013 Fresh Squeezed Pixels LLC. All rights reserved.
//

#import "TTSMainViewController.h"


@interface TTSMainViewController ()

@end

@implementation TTSMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", [AVSpeechSynthesisVoice speechVoices] );
    
    // set up our audio session
    _session = [AVAudioSession sharedInstance];
   
    [_session setCategory:AVAudioSessionCategoryPlayback error:nil];

    // set up our TTS synth
    _synth = [[AVSpeechSynthesizer alloc] init];
    
    [_synth setDelegate:self];
    
    
    _textInput.delegate = self;

    // Show the Keyboard
    [_textInput becomeFirstResponder];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    // Talk when the "Go" Button on the keyboard is pressed.
    [self talk:textField];
    
    return YES;
}

#pragma mark - Actions

-(IBAction)talk:(id)sender
{
    
    _textLabel.text = _textInput.text;
    
    AVSpeechUtterance* utterance = [AVSpeechUtterance speechUtteranceWithString:_textLabel.text];

    _voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    
    
    
    utterance.voice = _voice;
    
    utterance.rate = AVSpeechUtteranceDefaultSpeechRate - (AVSpeechUtteranceDefaultSpeechRate*0.4);
    
    [_synth speakUtterance:utterance];
    
}

#pragma mark - AVSpeechSynthesizerDelegate

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance
{

    // Highlight the portion of text that will be spoken.
    
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:_textLabel.text];
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:characterRange];
    
    _textLabel.attributedText = aString;
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance;
{
    // this line resets the string attributes so the label returns completely white.
    _textLabel.text = _textLabel.text;
}




@end
