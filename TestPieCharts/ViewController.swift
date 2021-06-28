//
//  ViewController.swift
//  TestPieCharts
//
//  Created by Soumitra MacBook on 23/06/21.
//

import UIKit
import Charts //Search with "Modify---" and Change According to the need

class ViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var chartView: PieChartView!
    let parties = ["Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
                   "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
                   "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
                   "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
                   "Party Y", "Party Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        
        chartView.delegate = self
        
//        let l = chartView.legend
//        l.horizontalAlignment = .right
//        l.verticalAlignment = .top
//        l.orientation = .vertical
//        l.xEntrySpace = 7
//        l.yEntrySpace = 0
//        l.yOffset = 0
//        chartView.legend = l

        // entry label styling
//        chartView.entryLabelColor = .black
//        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
//        sliderX.value = 4
//        sliderY.value = 100
//        self.slidersValueChanged(nil)
        
//        chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
        
        //self.setDataCount(5, range: 5)
        updateChartData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.chartOverView.layer.cornerRadius = self.chartOverView.frame.size.height/2
    }

//    override func updateChartData() {
//        if self.shouldHideData {
//            chartView.data = nil
//            return
//        }
//
//        self.setDataCount(Int(sliderX.value), range: UInt32(sliderY.value))
//    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                     label: parties[i % parties.count],
                                     icon: #imageLiteral(resourceName: "star"))
            
        }
        
        let set = PieChartDataSet(entries: entries, label: "Election Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.black)
        
        chartView.data = data
        chartView.highlightValues(nil)
    }
    
//    override func optionTapped(_ option: Option) {
//        switch option {
//        case .toggleXValues:
//            chartView.drawEntryLabelsEnabled = !chartView.drawEntryLabelsEnabled
//            chartView.setNeedsDisplay()
//
//        case .togglePercent:
//            chartView.usePercentValuesEnabled = !chartView.usePercentValuesEnabled
//            chartView.setNeedsDisplay()
//
//        case .toggleHole:
//            chartView.drawHoleEnabled = !chartView.drawHoleEnabled
//            chartView.setNeedsDisplay()
//
//        case .toggleLabelsMinimumAngle:
//            chartView.sliceTextDrawingThreshold = chartView.sliceTextDrawingThreshold == 0.0 ? 20.0 : 0.0
//            chartView.setNeedsDisplay()
//
//        case .drawCenter:
//            chartView.drawCenterTextEnabled = !chartView.drawCenterTextEnabled
//            chartView.setNeedsDisplay()
//
//        case .animateX:
//            chartView.animate(xAxisDuration: 1.4)
//
//        case .animateY:
//            chartView.animate(yAxisDuration: 1.4)
//
//        case .animateXY:
//            chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
//
//        case .spin:
//            chartView.spin(duration: 2,
//                           fromAngle: chartView.rotationAngle,
//                           toAngle: chartView.rotationAngle + 360,
//                           easingOption: .easeInCubic)
//
//        default:
//            handleOption(option, forChartView: chartView)
//        }
//    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {

        if let dataSet = chartView.data?.dataSets[ highlight.dataSetIndex] {

            let sliceIndex: Int = dataSet.entryIndex( entry: entry)
            print( "Selected slice index: \( sliceIndex)")
        }
    }
    
    
    func updateChartData()  {
        chartView.rotationEnabled = false
        chartView.entryLabelColor = .black
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
//        let l = chartView.legend
//        l.horizontalAlignment = .right
//        l.verticalAlignment = .top
//        l.orientation = .vertical
//        l.xEntrySpace = 7
//        l.yEntrySpace = 0
//        l.yOffset = 0
        
        chartView.legend.enabled = false
        

//       let chart = PieChartView(frame: self.view.frame)//chartView
       // 2. generate chart data entries
        _ = ["A", "B", "C", "D","E","F"]
        let money = [8.0, 12.0, 20.0, 20.0, 35.0, 5.0]
        var  colors: [UIColor] = []
        colors.append(UIColor.init(red: 93.0/255.0, green: 179.0/255.0, blue: 78.0/255.0, alpha: 1.0))
        colors.append(UIColor.init(red: 247.0/255.0, green: 192.0/255.0, blue: 70.0/255.0, alpha: 1.0))
        colors.append(UIColor.init(red: 63.0/255.0, green: 160.0/255.0, blue: 219.0/255.0, alpha: 1.0))
        colors.append(UIColor.init(red: 216.0/255.0, green: 65.0/255.0, blue: 124.0/255.0, alpha: 1.0))
        colors.append(UIColor.init(red: 167.0/255.0, green: 106.0/255.0, blue: 178.0/255.0, alpha: 1.0))
        colors.append(UIColor.init(red: 55.0/255.0, green: 106.0/255.0, blue: 157.0/255.0, alpha: 1.0))

       var entries = [PieChartDataEntry]()
        for (_, value) in money.enumerated() {
           let entry = PieChartDataEntry()
           entry.y = value
           entry.label = ""//track[index]
           entries.append(entry)
       }

       // 3. chart setup
        let set = PieChartDataSet( entries: entries, label: "Pie Chart")
       // this is custom extension method. Download the code for more details.
       set.colors = colors
        
       let data = PieChartData(dataSet: set)
        chartView.data = data
        chartView.noDataText = "No data available"
       // user interaction
        chartView.isUserInteractionEnabled = true

       let d = Description()
        d.text = ""//"Test Chart"
        chartView.chartDescription = d
        chartView.centerText = "Cost"
        chartView.transparentCircleColor = UIColor.clear
       self.view.addSubview(chartView)
        
        chartView.animate(xAxisDuration: 1.4, easingOption: .easeInOutCubic)

   }
    

}

