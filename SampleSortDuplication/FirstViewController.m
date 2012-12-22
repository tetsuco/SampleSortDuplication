//
//  FirstViewController.m
//  SampleSortDuplication
//
//  Created by tetsuco on 11/09/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // ソート処理
    [self arraySort];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// 昇順ソート
NSInteger intSort(id val1, id val2, void *context)
{
    int iVal1 = [val1 intValue];
    int iVal2 = [val2 intValue];
    
    if (iVal1 < iVal2)
        return NSOrderedAscending;
    else if (iVal1 > iVal2)
        return NSOrderedDescending;
    else {
        return NSOrderedSame;
    }
}

// ソート処理
- (void)arraySort
{
    // 重複オブジェクトが格納されている配列を用意
    NSArray *arDuplicate =[[NSArray alloc] initWithObjects:
                           @"3", 
                           @"3", 
                           @"4", 
                           @"1",  
                           @"1", 
                           @"2", 
                           @"5", 
                           @"5", 
                           @"5", 
                           nil];
    
    // NSSetに配列を格納し、重複オブジェクトを排除
    NSSet *aSet = [NSSet setWithArray:arDuplicate];
    
    // 重複オブジェクトを排除したものを配列へ格納
    NSArray *arrayNoDuplicate = [aSet allObjects];
    
    // ソート実施＆ソート結果を配列へ格納
    NSArray *srtResultArr = [NSArray alloc];
    srtResultArr = [arrayNoDuplicate sortedArrayUsingFunction:intSort context:NULL];
    
    
    /* 以下、表示ラベル */
    
    // 重複オブジェクト排除前、ソート前の配列の中身を表示
    UILabel *arDuplicateLabel1 = [[UILabel alloc] init];
    arDuplicateLabel1.frame = CGRectMake(10, 10, 300, 20);
    arDuplicateLabel1.font = [UIFont systemFontOfSize:12];
    arDuplicateLabel1.text = @"重複オブジェクト排除前、ソート前の配列の中身";
    [self.view addSubview:arDuplicateLabel1];
    [arDuplicateLabel1 release];
    
    UILabel *arDuplicateLabel2 = [[UILabel alloc] init];
    arDuplicateLabel2.frame = CGRectMake(10, 30, 300, 20);
    arDuplicateLabel2.backgroundColor = [UIColor greenColor];
    arDuplicateLabel2.font = [UIFont systemFontOfSize:14];
    arDuplicateLabel2.text = [arDuplicate description];    // 配列の中身を表示
    [self.view addSubview:arDuplicateLabel2];
    [arDuplicateLabel2 release];
    
    
    // 重複オブジェクト排除後、ソート前の配列の中身を表示
    UILabel *arrayNoDuplicateLabel1 = [[UILabel alloc] init];
    arrayNoDuplicateLabel1.frame = CGRectMake(10, 90, 300, 20);
    arrayNoDuplicateLabel1.font = [UIFont systemFontOfSize:12];
    arrayNoDuplicateLabel1.text = @"重複オブジェクト排除後、ソート前の配列の中身";
    [self.view addSubview:arrayNoDuplicateLabel1];
    [arrayNoDuplicateLabel1 release];
    
    UILabel *arrayNoDuplicateLabel2 = [[UILabel alloc] init];
    arrayNoDuplicateLabel2.frame = CGRectMake(10, 110, 300, 20);
    arrayNoDuplicateLabel2.backgroundColor = [UIColor greenColor];
    arrayNoDuplicateLabel2.font = [UIFont systemFontOfSize:14];
    arrayNoDuplicateLabel2.text = [arrayNoDuplicate description];    // 配列の中身を表示
    [self.view addSubview:arrayNoDuplicateLabel2];
    [arrayNoDuplicateLabel2 release];
    
    
    // 重複オブジェクト排除後、ソート後の配列の中身を表示
    UILabel *srtResultArrLabel1 = [[UILabel alloc] init];
    srtResultArrLabel1.frame = CGRectMake(10, 170, 300, 20);
    srtResultArrLabel1.font = [UIFont systemFontOfSize:12];
    srtResultArrLabel1.text = @"重複オブジェクト排除後、ソート後の配列の中身";
    [self.view addSubview:srtResultArrLabel1];
    [srtResultArrLabel1 release];
    
    UILabel *srtResultArrLabel2 = [[UILabel alloc] init];
    srtResultArrLabel2.frame = CGRectMake(10, 190, 300, 20);
    srtResultArrLabel2.backgroundColor = [UIColor greenColor];
    srtResultArrLabel2.font = [UIFont systemFontOfSize:14];
    srtResultArrLabel2.text = [srtResultArr description];    // 配列の中身を表示
    [self.view addSubview:srtResultArrLabel2];
    [srtResultArrLabel2 release];
}

@end
