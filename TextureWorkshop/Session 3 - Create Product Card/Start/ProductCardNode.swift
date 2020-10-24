//
//  ProductCardNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 08/10/20.
//

import AsyncDisplayKit

class ProductCardNode: ASDisplayNode {
    let imageNode = ASNetworkImageNode()

    let productDescription: ProductCardDescriptionNode

    init(model: Product) {
        productDescription = ProductCardDescriptionNode(description: model.description)

        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        setShadow()

        imageNode.url = model.imageURL
        imageNode.style.preferredSize = CGSize(width: 80, height: 80)
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let mainStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [imageNode, productDescription]
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
