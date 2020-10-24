//
//  ProductCardStarterViewController.swift
//  TextureWorkshop
//
//  Created by Benny Kurniawan on 21/10/20.
//

import AsyncDisplayKit

class ProductCardStarterViewController: ASDKViewController<ASTableNode> {
    let model = sampleProducts
    
    override init() {
        super.init(node: ASTableNode())
        node.backgroundColor = .white

        node.dataSource = self
        
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Expected", style: .plain, target: self, action: #selector(goToResultViewController)), animated: false)
    }
    
    @objc func goToResultViewController() {
        let vc = ProductCardViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCardStarterViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        model.count
    }

    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let data = model[indexPath.row]
        return ProductCardNode(model: data)
    }
}
