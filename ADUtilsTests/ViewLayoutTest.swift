//
//  ViewLayoutTest.swift
//  ADUtils
//
//  Created by Benjamin Lavialle on 16/05/2017.
//
//

import Foundation
import Quick
import ADUtils
import Nimble

class ViewLayout: QuickSpec {

    override func spec() {

        let veryLongText = "Lorem sizzle pimpin' sit amizzle, yippiyo adipiscing izzle. Nullizzle bling bling velit, away ghetto, suscipit dang, gravida vel, ass. Pellentesque eget tortor. Bow wow wow erizzle. Own yo' uhuh ... yih! sizzle dapibizzle turpis tempus shut the shizzle up. Maurizzle fo shizzle my nizzle crunk et turpizzle. Phat in tortizzle. Fizzle eleifend rhoncizzle i'm in the shizzle. In shut the shizzle up habitasse platea dictumst. Sheezy dapibizzle. Fo tellizzle urna, pretizzle eu, stuff shut the shizzle up, you son of a bizzle boofron, nunc. Fo suscipizzle. Integer sempizzle shizzle my nizzle crocodizzle ass purus"

        let width: CGFloat = 100
        let frame = CGRect(x: 0.0, y: 0.0, width: 320.0, height: 100.0)

        let addLabelInView = { (view: UIView) in
            let label = UILabel()
            label.numberOfLines = 0
            label.text = veryLongText
            view.addSubview(label)
            label.ad_pinToSuperview()
        }

        it("should layout regular view") {
            // Given
            let view = UIView(frame: frame)
            addLabelInView(view)
            // When
            let height = view.ad_preferredLayoutHeight(fittingWidth: width)
            // Then
            expect(height).to(equal(CGFloat(1218.0)))
        }

        it("should layout UICollectionViewCell") {
            // Given
            let cell = UICollectionViewCell(frame: frame)
            addLabelInView(cell.contentView)
            // When
            let height = cell.ad_preferredCellLayoutHeight(fittingWidth: width)
            // Then
            expect(height).to(equal(CGFloat(1218.0)))
        }

        it("should layout UITableViewCell") {
            // Given
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.frame = frame
            addLabelInView(cell.contentView)
            // When
            let height = cell.ad_preferredCellLayoutHeight(fittingWidth: width)
            // Then
            expect(height).to(equal(CGFloat(1218.0)))
        }

        it("should layout UITableViewHeaderFooterView") {
            // Given
            let headerFooter = UITableViewHeaderFooterView(reuseIdentifier: nil)
            headerFooter.frame = frame
            addLabelInView(headerFooter.contentView)
            // When
            let height = headerFooter.ad_preferredContentViewLayoutHeight(fittingWidth: width)
            // Then
            expect(height).to(equal(CGFloat(1218.0)))
        }
    }
}
