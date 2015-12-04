

#import <UIKit/UIKit.h>

#import "DRDynamicSlideShow.h"

@interface MainViewController : UIViewController <UIBarPositioningDelegate>

// Slide Show
@property (weak, nonatomic) IBOutlet DRDynamicSlideShow *slideShow;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

// Page 0
@property (weak, nonatomic) IBOutlet UILabel *helloLabel;
@property (weak, nonatomic) IBOutlet UITextView *welcomeLabel;

// Page 1
@property (weak, nonatomic) IBOutlet UIImageView *magicStickImageView;
@property (weak, nonatomic) IBOutlet UITextView *magicStickDescriptionTextView;

// Page 2
@property (weak, nonatomic) IBOutlet UILabel *codeBracketsLabel;
@property (weak, nonatomic) IBOutlet UITextView *codingDescriptionTextView;
@property (strong, nonatomic) IBOutlet UIButton *start;

@end