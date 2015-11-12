//
//  ViewController.m
//  GitSample
//
//  Created by cmh on 2015. 11. 10..
//  Copyright (c) 2015년 cmh. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewSampleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cellection View Test"];
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    
    if (indexPath.row == 0) {
        CollectionViewSampleViewController *vc = [[UIStoryboard storyboardWithName:@"CollectionViewSample" bundle:nil] instantiateViewControllerWithIdentifier:@"CollectionViewSampleViewController"];
        
        [self presentViewController:vc animated:YES completion:^{}];
    }else{
    
    
    }
    
    
}



#pragma mark - UITableViewDataSource




@end
