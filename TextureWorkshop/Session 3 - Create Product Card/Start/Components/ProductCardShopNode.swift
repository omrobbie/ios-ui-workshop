//
//  ProductCardShopNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardShopNode: ASDisplayNode {
    let badgeNode: ASImageNode?
    let nameNode = ASTextNode()

    init(shop: Product.Description.Shop) {
        switch shop.type {
        case .powerMerchant:
            badgeNode = ASImageNode()
            badgeNode?.image = #imageLiteral(resourceName: "power_merchant")
        case .officialStore:
            badgeNode = ASImageNode()
            badgeNode?.image = #imageLiteral(resourceName: "official_store")
        case .none:
            badgeNode = nil
        }

        badgeNode?.style.preferredSize = CGSize(width: 16, height: 16)

        nameNode.attributedText = NSAttributedString(
            string: shop.name,
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                .foregroundColor: UIColor.darkGray
            ]
        )

        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let children: [ASLayoutElement]

        if let badgeNode = badgeNode {
            children = [badgeNode, nameNode]
        } else {
            children = [nameNode]
        }

        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 4,
            justifyContent: .start,
            alignItems: .start,
            children: children
        )
    }
}
