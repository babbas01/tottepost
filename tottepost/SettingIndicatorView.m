//
//  SettingIndicatorView.m
//  tottepost
//
//  Created by Kentaro ISHITOYA on 12/01/01.
//  Copyright (c) 2012 cocotomo. All rights reserved.
//

#import "SettingIndicatorView.h"
#import "PhotoSubmitterManager.h"

//-----------------------------------------------------------------------------
//Private Implementations
//-----------------------------------------------------------------------------
@interface SettingIndicatorView(PrivateImplementation)
- (void) setupInitialState: (CGRect)frame;
@end

@implementation SettingIndicatorView(PrivateImplementation)
/*!
 * initialize
 */
- (void)setupInitialState:(CGRect)frame{
    self.frame = frame;
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = NO;
    label_ = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, 40, self.contentSize.height - 1)];
    label_.font = [UIFont systemFontOfSize: 8];
    label_.backgroundColor = [UIColor clearColor];
    label_.textColor = [UIColor grayColor];
    label_.textAlignment = UITextAlignmentRight;
    [self addSubview:label_];
    [self update];
}
@end

//-----------------------------------------------------------------------------
//Public Implementations
//----------------------------------------------------------------------------
@implementation SettingIndicatorView
/*!
 * initialize
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitialState:frame];
    }
    return self;
}

/*!
 * update
 */
- (void) update{
    for (UIView *v in self.subviews){
        if(v != label_){
            [v removeFromSuperview];
        }
    }
    int x = label_.frame.size.width + 4;
    for (NSNumber *num in [PhotoSubmitterManager getInstance].supportedTypes){
        PhotoSubmitterType type = (PhotoSubmitterType)[num intValue];
        id<PhotoSubmitterProtocol> submitter = [PhotoSubmitterManager submitterForType:type];
        if(submitter.isEnabled){
            CGRect rect = CGRectMake(x, 0, submitter.smallIcon.size.width, submitter.smallIcon.size.height);
            UIImageView *iv = [[UIImageView alloc] initWithImage:submitter.smallIcon];
            iv.frame = rect;
            iv.backgroundColor = [UIColor clearColor];
            iv.alpha = 0.6;
            [self addSubview:iv];
            x += submitter.smallIcon.size.width;
        }
    }
    if([PhotoSubmitterManager getInstance].enableGeoTagging){
        label_.text = @"GPS ON";
    }else{
        label_.text = @"";
    }
}

/*!
 * content Size
 */
- (CGSize)contentSize{
    id<PhotoSubmitterProtocol> submitter = [PhotoSubmitterManager submitterForType:PhotoSubmitterTypeFacebook];
    return CGSizeMake(label_.frame.size.width + 4 + submitter.smallIcon.size.width * [PhotoSubmitterManager getInstance].enabledSubmitterCount, submitter.smallIcon.size.height);
    
}
@end
