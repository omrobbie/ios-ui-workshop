//
//  ProductCardNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 08/10/20.
//

import AsyncDisplayKit

class ProductCardNode: ASDisplayNode {
    let imageNode = ASNetworkImageNode()
    let nameNode = ASTextNode()
    let priceNode = ASTextNode()

    init(model: Product) {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        setShadow()

        imageNode.url = model.imageURL
        imageNode.style.preferredSize = CGSize(width: 80, height: 80)

        nameNode.attributedText = NSAttributedString(
            string: model.description.name,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)
            ]
        )

        priceNode.attributedText = NSAttributedString(
            string: model.description.price,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)
            ]
        )
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let verticalStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 10,
            justifyContent: .start,
            alignItems: .start,
            children: [nameNode, priceNode]
        )

        let mainStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [imageNode, verticalStack]
        )

        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            child: mainStack
        )
    }
    
    func setShadow() {
        clipsToBounds = false
        cornerRadius = 8
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 0.12
        shadowOffset.height = 2
        shadowRadius = 4
    }
    
    override func layout() {
        super.layout()
        // Optimize performance for rendering shadow
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
}
