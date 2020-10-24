//
//  BasicTextureViewController.swift
//  TextureWorkshop
//
//  Created by Jefferson Setiawan on 06/10/20.
//

import AsyncDisplayKit

class BasicTextureViewController: ASDKViewController<ASDisplayNode> {
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .white

        let subNode = ASDisplayNode()
        subNode.backgroundColor = .orange
//        subNode.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        subNode.style.preferredSize = CGSize(width: 300, height: 300)

        node.addSubnode(subNode)

        node.layoutSpecBlock = { (_, _) -> ASLayoutSpec in
            return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: [], child: subNode)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
