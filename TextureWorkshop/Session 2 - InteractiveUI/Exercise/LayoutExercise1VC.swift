//
//  LayoutExerciseVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 14/10/20.
//

import Foundation
import AsyncDisplayKit

internal class LayoutExercise1VC: ASDKViewController<ASDisplayNode> {
    
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
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }

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

            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 0, left: 0, bottom: .infinity, right: .infinity),
                child: mainStack)
        }
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    // MARK: Functions
    
    private func setupNavigation() {
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Example", style: .plain, target: self, action: #selector(goToChildVC)), animated: false)
    }
    
    @objc private func goToChildVC() {
        let example = Exercise1CheatVC()
        navigationController?.pushViewController(example, animated: true)
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

