//
//  CustomNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 15/10/20.
//

import Foundation
import AsyncDisplayKit

internal class CustomNode: ASDisplayNode {
    
    // MARK: UI Elements

    private let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.style.preferredSize = CGSize(width: 80, height: 80)
        node.image = UIImage(named: "product")
        return node
    }()

    private let titleTextNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "Title Lorem Ipsum")
        return node
    }()

    private let subtitleTextNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "Subtitle text.. lalala")
        return node
    }()

    private let backgroundNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        return node
    }()

    // MARK: Properties
    
    internal override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let descriptionStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [self.titleTextNode, self.subtitleTextNode])

        let mainStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 8,
            justifyContent: .start,
            alignItems: .center,
            children: [self.imageNode, descriptionStack])

        return ASBackgroundLayoutSpec(
            child: mainStack,
            background: self.backgroundNode)
    }
}
