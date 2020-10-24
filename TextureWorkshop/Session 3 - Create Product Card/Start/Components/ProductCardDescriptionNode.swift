//
//  ProductCardDescriptionNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardDescriptionNode: ASDisplayNode {
    let nameNode = ASTextNode()
    let priceNode = ASTextNode()

    init(description: Product.Description) {
        super.init()
        automaticallyManagesSubnodes = true

        nameNode.attributedText = NSAttributedString(
            string: description.name,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)
            ]
        )

        priceNode.attributedText = NSAttributedString(
            string: description.price,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)
            ]
        )
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 10,
            justifyContent: .start,
            alignItems: .start,
            children: [nameNode, priceNode]
        )
    }
}
