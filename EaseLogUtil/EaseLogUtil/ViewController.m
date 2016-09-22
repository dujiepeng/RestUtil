//
//  ViewController.m
//  EaseLogUtil
//
//  Created by 杜洁鹏 on 9/21/16.
//  Copyright © 2016 杜洁鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController() {
    NSString *_appServer;
}

@property (nonatomic, strong) NSArray *serverAry;
@property (weak) IBOutlet NSTextField *appkeyTextField;
@property (weak) IBOutlet NSComboBox *selectedComboBox;
@property (weak) IBOutlet NSDatePicker *beganTime;
@property (weak) IBOutlet NSDatePicker *endTime;
@property (weak) IBOutlet NSPathControl *selectedPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _appServer = [self.serverAry objectAtIndex:0];
    [_selectedComboBox selectItemAtIndex:0];
}

- (IBAction)serverSelected:(NSComboBox *)sender {
    _appServer = [self.serverAry objectAtIndex:(int)sender.indexOfSelectedItem];
}

- (IBAction)cancelDownLowd:(id)sender {
}

- (IBAction)startDownLoad:(id)sender {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"开始查找并导出，请稍后"];
    [alert setInformativeText:@"如果想取消操作，请点击取消。"];
    [alert addButtonWithTitle:@"取消"];
    [alert setAlertStyle:NSWarningAlertStyle];
    [alert beginSheetModalForWindow:self.view.window
                      modalDelegate:nil
                     didEndSelector:nil
                        contextInfo:nil];
    
    [self beganSearchAndDownLoad];
}

- (IBAction)selectedPathAction:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setMessage:@"请选择下载路径"];
    [panel setPrompt:@"确定"];
    [panel setCanChooseDirectories:YES];
    [panel setCanCreateDirectories:YES];
    [panel setCanChooseFiles:NO];
    NSInteger result = [panel runModal];
    if (result == NSFileHandlingPanelOKButton) {
        self.selectedPath.URL = [panel URL];
    }
}

- (NSArray *)serverAry{
    if (!_serverAry) {
        _serverAry = @[@"http://a1.easemob.com",
                       @"http://a1-vip1.easemob.com",
                       @"http://a1-vip5.easemob.com",
                       @"http://a1-vip6.easemob.com"];
    }
    
    return _serverAry;
}

- (void)beganSearchAndDownLoad {
    NSLog(@"str --- %@",[NSString stringWithFormat:@"%@/%@",_appServer,self.appkeyTextField.stringValue ]);
}
@end
