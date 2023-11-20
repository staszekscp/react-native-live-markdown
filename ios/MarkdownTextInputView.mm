#ifdef RCT_NEW_ARCH_ENABLED
#import "MarkdownTextInputView.h"

#import <react/renderer/components/RNMarkdownTextInputViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNMarkdownTextInputViewSpec/EventEmitters.h>
#import <react/renderer/components/RNMarkdownTextInputViewSpec/Props.h>
#import <react/renderer/components/RNMarkdownTextInputViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface MarkdownTextInputView () <RCTMarkdownTextInputViewViewProtocol>

@end

@implementation MarkdownTextInputView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<MarkdownTextInputViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const MarkdownTextInputViewProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<MarkdownTextInputViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<MarkdownTextInputViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> MarkdownTextInputViewCls(void)
{
    return MarkdownTextInputView.class;
}

@end
#endif
