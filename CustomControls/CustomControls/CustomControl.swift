import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var ratingLabels = [UILabel]()
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    private func setup() {
        var count: CGFloat = 0
        
        //loop to create 5 labels with each label's frame to componentDimension by componentDimension
        for number in 1...5 {
            
            //layout labels in a row with 8 spacing
            let space: CGFloat = (componentDimension * count) + (8.0)
            
            let label = UILabel(frame: CGRect(x: space, y: 0, width: componentDimension, height: componentDimension))
         
        //append
            self.addSubview(label)
            
        //add tag to represent which star it is
            label.text = "☆"
            label.tag = number
            ratingLabels.append(label)
            count += 1.0
            
        //font bold system font, size 32.0
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            
        //set unicode star and align center for label
            label.textAlignment = .center
            
        //set label's text color
            label.textColor = componentInactiveColor
        }
    }
        override var intrinsicContentSize: CGSize {
            let componentsWidth = CGFloat(componentCount) * componentDimension
            let componentsSpacing = CGFloat(componentCount + 1) * 8.0
            let width = componentsWidth + componentsSpacing
            return CGSize(width: width, height: componentDimension)
        }
    }

