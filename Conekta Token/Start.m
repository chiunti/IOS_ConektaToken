//
//  ViewController.m
//  Conekta Token
//
//  Created by admin on 28/11/15.
//  Copyright © 2015 chiuntisoft. All rights reserved.
//

#import "Start.h"
#import "Conekta.h"

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [self getConektaToken];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) getConektaToken {
    Conekta *conekta = [[Conekta alloc] init];
    
    [conekta setDelegate: self];
    
    [conekta setPublicKey:@"key_AzrZKrS9Y56ZC6WEqVm3iqA"];
    
    [conekta collectDevice];
    
    Card *card = [conekta.Card initWithNumber: @"4242424242424242" name: @"Julian Ceballos" cvc: @"123" expMonth: @"10" expYear: @"2016"];
    
    Token *token = [conekta.Token initWithCard:card];
    
    [token createWithSuccess: ^(NSDictionary *data) {
        NSLog(@"%@", data);
    } andError: ^(NSError *error) {
        NSLog(@"%@", error);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
