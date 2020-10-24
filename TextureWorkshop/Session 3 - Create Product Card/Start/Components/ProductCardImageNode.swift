//
//  ProductCardImageNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardImageNode: ASDisplayNode {
    let imageNode = ASNetworkImageNode()
    let wishListNode = ProductCardWishlistNode()
    
    init(imageUrl: URL?) {
        super.init()
        automaticallyManagesSubnodes = true

        imageNode.url = imageUrl
        imageNode.style.preferredSize = CGSize(width: 80, height: 80)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wishListInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 4, left: 4, bottom: .infinity, right: .infinity),
            child: wishListNode
        )

        return ASOverlayLayoutSpec(
            child: imageNode,
            overlay: wishListInset
        )
    }
}
