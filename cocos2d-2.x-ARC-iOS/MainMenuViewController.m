//
//  MainMenuViewController.m
//  5-choice
//
//  Created by Víctor Baro on 29/08/12.
//
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@property (nonatomic, strong) RootViewController *rootViewController;

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (IBAction)launchCocos:(id)sender {
    self.rootViewController = [[RootViewController alloc]init];
    [self.navigationController pushViewController:self.rootViewController animated:YES];
    
}
     
@end
