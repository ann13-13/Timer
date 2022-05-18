//
//  ViewController.swift
//  Timer
//
//  Created by Student on 25.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    var StartPause = Timer()
    var timer: Double = 0.0
    var array: [String] = []
    var isPlay: Bool = false
    
    @IBOutlet weak var tableLap: UITableView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerOutput: UILabel!
    
    @IBAction func TimerActive(_sender:UIButton){
        isPlay = !isPlay
        if isPlay{
            StartPause = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(Time), userInfo: nil, repeats: true)
            let image = UIImage(systemName: "pause.fill")
            _sender.setImage(image, for: .normal)
            _sender.setTitle("Pause", for: .normal)
            let imageReset = UIImage(systemName: "pause.rectangle.fill")
            resetButton.setImage(imageReset, for: .normal)
            resetButton.setTitle("Lap", for:.normal)
            resetButton.isEnabled = true
        }
        
        else {
            StartPause.invalidate()
            let image = UIImage(systemName: "play.fill")
            _sender.setImage(image, for: .normal)
            _sender.setTitle("Start", for: .normal)
            let imageReset = UIImage(systemName: "trash.fill")
            resetButton.setImage(imageReset, for: .normal)
            resetButton.setTitle("Reset", for: .normal)
        }
        
        
        
        func addLap(_ sender: UIButton) {
                if isPlay{
                array.append(timerOutput.text!)
                tableLap.reloadData()
                    
                } else {
                    timer = 0.0
                    timerOutput.text = "00:00"
                    array.removeAll()
                    tableLap.reloadData()
                    sender.isEnabled = false
                }
                
            }
            
        @objc func Time() {
           timer += 0.1
           var minute: String = "\(Int(timer) / 60)"
           if Int(minute)! < 10 {
               minute = "0\(minute)"
           }
           
           var seconds: String = String(format: "%.1f",timer.truncatingRemainder(dividingBy: 60))
           if Int(timer.truncatingRemainder(dividingBy: 60)) < 10 {
               seconds = "0\(seconds)"
           }
           
           timerOutput.text = "\(minute):\(seconds)"
           
       }
            
            
        func viewDidLoad() {
                super.viewDidLoad()
                
                tableLap.delegate = self
                tableLap.dataSource = self
            
            }
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return array.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! row
                
                cell.rowLabel.text = array[indexPath.row]
                return cell
            }


        }

        class row: UITableViewCell {
            
            @IBOutlet weak var rowLabel: UILabel!
            
        }
        
    }


