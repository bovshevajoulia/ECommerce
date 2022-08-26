//
//  FontStyleGuide.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct FontStyleGuide: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(spacing: 10) {
                
                Text("Large Title")
                    .customFont(.largeTitle)
                
                Text("Title")
                    .customFont(.title)
                
                Text("Title 2")
                    .customFont(.title2)
                
                Text("Title 3")
                    .customFont(.title3)
            }
            
            VStack(spacing: 10) {
                Text("Body")
                    .customFont(.body)
                
                Text("Headline")
                    .customFont(.headline)
                
                Text("subheadline")
                    .customFont(.subheadline)
                
                Text("subheadline2")
                    .customFont(.subheadline2)
                
                Text("caption")
                    .customFont(.caption)
                
                Text("caption 2")
                    .customFont(.caption2)
                
                Text("footnote")
                    .customFont(.footnote)
                
                Text("footnote 2")
                    .customFont(.footnote2)
            }
        }
    }
}


struct CustomFontStyle: ViewModifier {
    var textStyle: TextStyle
    
    var name: String {
        switch textStyle {
            case .largeTitle, .title, .title2, .title3, .body2:
                return "Mark Pro-Bold"
            case .body, .subheadline, .footnote, .caption, .caption3:
                return "Mark Pro-Regular"
            case .headline, .subheadline2, .footnote2, .caption2:
                return "Mark Pro-SemiBold"
            case .headline2, .headline3:
                return "Mark Pro-Medium"
        }
    }
    
    var size: CGFloat {
        switch textStyle {
            case .largeTitle:
                return 35 // should be 34
            case .title:
                return 25 // should be 28
            case .title2:
                return 24
            case .title3:
                return 20
            case .body:
                return 17
            case .body2: // custom
                return 16
            case .headline:
                return 17
            case .headline2: // custom
                return 18
            case .headline3: // custom
                return 10
            case .subheadline:
                return 15
            case .subheadline2:
                return 15
            case .footnote:
                return 13
            case .footnote2:
                return 13
            case .caption:
                return 12
            case .caption2:
                return 12
            case .caption3: // custom
                return 10
        }
    }
    
    var relative: Font.TextStyle {
        switch textStyle {
            case .largeTitle:
                return .largeTitle
            case .title:
                return .title
            case .title2:
                return .title2
            case .title3:
                return .title3
            case .body:
                return .body
            case .body2:
                return .body
            case .headline:
                return .headline
            case .headline2:
                return .headline
            case .headline3:
                return .headline
            case .subheadline:
                return .subheadline
            case .subheadline2:
                return .subheadline
            case .footnote:
                return .footnote
            case .footnote2:
                return .footnote
            case .caption:
                return .caption
            case .caption2:
                return .caption
            case .caption3:
                return .caption
        }
    }
    
    func body(content: Content) -> some View {
        content.font(.custom(name, size: size, relativeTo: relative))
    }
}

extension CustomFontStyle {
    
    enum TextStyle {
        case largeTitle
        case title
        case title2
        case title3
        case body
        case body2
        case headline
        case headline2
        case headline3
        case subheadline
        case subheadline2
        case footnote
        case footnote2
        case caption
        case caption2
        case caption3
    }
}

extension View {
    func customFont(_ textStyle: CustomFontStyle.TextStyle) -> some View {
        modifier(CustomFontStyle(textStyle: textStyle))
    }
}

struct CardTitleStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SF Pro Display-Bold", size: 25, relativeTo: .title))

    }
}

struct CardHeadlineStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SF Pro Display-Regular", size: 11, relativeTo: .title))

    }
}

struct FontStyleGuide_Previews: PreviewProvider {
    static var previews: some View {
        FontStyleGuide()
    }
}
