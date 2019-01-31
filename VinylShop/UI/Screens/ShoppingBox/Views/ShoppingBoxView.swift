import Anchorage
import Hue
import UIKit

class ShoppingBoxView: UIView {

    let boxView: UIView = UIView(frame: .zero)
        |> background(color: .blue2FC5D8)
        <> rounded(radius: 15, corners: .top)

    let dismissIconView = UIImageView(frame: .zero)
        |> image(#imageLiteral(resourceName: "dismiss_box_arrow"))

    let titleLabel = UILabel(frame: .zero)
        |> text("Shopping Box")
        <> font(.nunito(.semibold), size: 26.0, color: .whiteFFFFFF)

    let itemsView = ShoppingBoxItemsView()
    let topSeparatorView = ShoppingBoxSeparatorView()
    let bottomSeparatorView = ShoppingBoxSeparatorView()
    let footerView = ShoppingBoxFooterView()

    init() {
        super.init(frame: .zero)

        setUpSelf()
        addSubviews()
        setUpLayout()
    }

    // MARK: - Configuration

    private func setUpSelf() {
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }

    // MARK: - Subviews

    private func addSubviews() {
        [boxView, itemsView, dismissIconView, titleLabel, topSeparatorView, bottomSeparatorView, footerView]
            .forEach(addSubview)
    }

    // MARK: - Layout

    private func setUpLayout() {
        boxView.horizontalAnchors == horizontalAnchors
        boxView.bottomAnchor == bottomAnchor

        dismissIconView.sizeAnchors == CGSize(width: 44, height: 11)
        dismissIconView.centerXAnchor == boxView.centerXAnchor
        dismissIconView.topAnchor == boxView.topAnchor + 20

        titleLabel.centerXAnchor == dismissIconView.centerXAnchor
        titleLabel.topAnchor == dismissIconView.bottomAnchor + 30

        topSeparatorView.topAnchor == titleLabel.bottomAnchor + 30
        topSeparatorView.horizontalAnchors == boxView.horizontalAnchors + 20
        topSeparatorView.heightAnchor == 3

        itemsView.horizontalAnchors == topSeparatorView.horizontalAnchors
        itemsView.topAnchor == topSeparatorView.bottomAnchor + 15

        bottomSeparatorView.horizontalAnchors == topSeparatorView.horizontalAnchors
        bottomSeparatorView.topAnchor == itemsView.bottomAnchor + 15
        bottomSeparatorView.heightAnchor == 3

        footerView.topAnchor == bottomSeparatorView.bottomAnchor + 30
        footerView.bottomAnchor == boxView.bottomAnchor - 30
        footerView.horizontalAnchors == topSeparatorView.horizontalAnchors
    }

    // MARK: - Required initializer

    required init?(coder _: NSCoder) { return nil }

}
