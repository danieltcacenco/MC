

#import <UIKit/UIKit.h>
@protocol EmotionPickerDelegate

-(void)emotionPicker:(id)controller didSelectedEmotion:(NSString *)emtion;
-(void)emotionPickerCancelled;

@end

@interface EmotionPicker : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableView;
    NSArray *dataSource;
    __weak id<EmotionPickerDelegate>delegate;
}
@property (weak, nonatomic) id<EmotionPickerDelegate>delegate;
@end
