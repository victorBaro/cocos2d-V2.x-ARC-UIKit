//
//  RootViewController.m
//  5-choice
//
//  Created by Víctor Baro on 31/08/12.
//
//

#import "RootViewController.h"


@interface RootViewController ()

- (void) setupCocos;

@end

@implementation RootViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setupCocos {
    CCDirector *director_ = (CCDirectorIOS*)[CCDirector sharedDirector];
    
    if([director_ isViewLoaded] == NO){
    // Create an CCGLView with a RGB565 color buffer, and a depth buffer of 0-bits
	CCGLView *glView = [CCGLView viewWithFrame:[self.view bounds]
								   pixelFormat:kEAGLColorFormatRGB565	//kEAGLColorFormatRGBA8
								   depthFormat:0	//GL_DEPTH_COMPONENT24_OES
							preserveBackbuffer:NO
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0];
        
        // attach the openglView to the director
        [director_ setView:glView];
    }
    
	director_.wantsFullScreenLayout = YES;
    
    // Display FSP and SPF
	[director_ setDisplayStats:YES];
    
	// set FPS at 60
	[director_ setAnimationInterval:1.0/60];
    
	// for rotation and other messages
	[director_ setDelegate:self];
    
	// 2D projection
	[director_ setProjection:kCCDirectorProjection2D];
    
    // Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
	if( ! [director_ enableRetinaDisplay:YES] )
		CCLOG(@"Retina Display Not supported");
    
    
    // Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    
	// If the 1st suffix is not found and if fallback is enabled then fallback suffixes are going to searched. If none is found, it will try with the name without suffix.
	// On iPad HD  : "-ipadhd", "-ipad",  "-hd"
	// On iPad     : "-ipad", "-hd"
	// On iPhone HD: "-hd"
    
	CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
	[sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];		// Default on iPhone RetinaDisplay is "-hd"
	[sharedFileUtils setiPadSuffix:@"-ipad"];					// Default on iPad is "ipad"
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];	// Default on iPad RetinaDisplay is "-ipadhd"
    
	// Assume that PVR images have premultiplied alpha
	[CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
    
    
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCLOG(@"Position1: %f, %f", size.width /2 , size.height/2);
    
    CCLOG(@"Position2: %f, %f", director_.view.frame.size.width/2, director_.view.frame.size.height/2);
    
    // Add the director as a child view controller of this view controller.
    [self addChildViewController:director_];
    
    // Add the director's OpenGL view as a subview so we can see it.
    [self.view addSubview:director_.view];
    [self.view sendSubviewToBack:director_.view];
    
    // Finish up our view controller containment responsibilities.
    [director_ didMoveToParentViewController:self];
    
    // Run whatever scene we'd like to run here.
    
    if (director_.runningScene){
        [director_ replaceScene:[HelloWorldLayer scene]];
        CCLOG(@"replaceScene launched");
    } else {
        [director_ runWithScene:[HelloWorldLayer scene]];
        CCLOG(@"runwithScene launched");
    }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    //Start cocos with default config
    [self setupCocos];
    
}

- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    [[CCDirector sharedDirector] setDelegate:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}



- (IBAction)returnButtonPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
